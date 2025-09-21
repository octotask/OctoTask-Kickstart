#!/usr/bin/env bash
#
# snapshot.sh - Create a clean snapshot of a GitHub repository
# -------------------------------------------------------------
# Features:
# - Validates GitHub URL and required tools
# - Fetches commit and release metadata from GitHub API
# - Clones the repository shallowly
# - Copies source files excluding common junk
# - Saves metadata and optional tar.gz archive
# - Uses strict error handling and clear, colored output

set -euo pipefail

# --- Colors ---
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# --- Utility Functions ---
print_status()   { echo -e "${GREEN}[INFO]${NC} $*"; }
print_warning()  { echo -e "${YELLOW}[WARN]${NC} $*"; }
print_error()    { echo -e "${RED}[ERROR]${NC} $*" >&2; }
require_cmd()    { command -v "$1" >/dev/null 2>&1 || { print_error "'$1' is required but not installed"; exit 1; }; }

# --- Validate Arguments ---
if [[ $# -eq 0 ]]; then
  print_error "Usage: $0 <github-url>"
  print_error "Example: $0 https://github.com/webtorrent/webtorrent"
  exit 1
fi

URL="$1"
if [[ ! "$URL" =~ ^https://github\.com/[^/]+/[^/]+/?$ ]]; then
  print_error "Invalid URL format. Expected: https://github.com/owner/repo"
  exit 1
fi

# --- Prerequisites ---
require_cmd curl
require_cmd git
require_cmd rsync
require_cmd jq

# --- Extract Repo Info ---
REPO_PATH="${URL#https://github.com/}"
REPO_PATH="${REPO_PATH%/}"
OWNER="${REPO_PATH%%/*}"
REPO="${REPO_PATH##*/}"

print_status "Processing repository: $OWNER/$REPO"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APPS_DIR="$SCRIPT_DIR/apps"
TEMP_DIR="$(mktemp -d)"

cleanup() {
  [[ -d "$TEMP_DIR" ]] && rm -rf "$TEMP_DIR"
}
trap cleanup EXIT

mkdir -p "$APPS_DIR"

# --- Fetch Metadata ---
API_URL="https://api.github.com/repos/$OWNER/$REPO"
print_status "Fetching repository metadata..."
REPO_INFO=$(curl -sL "$API_URL" || true)
COMMIT_INFO=$(curl -sL "$API_URL/commits/HEAD" || true)

COMMIT_HASH=$(jq -r '.sha' <<<"$COMMIT_INFO" | cut -c1-7)
COMMIT_DATE=$(jq -r '.commit.committer.date' <<<"$COMMIT_INFO")

if [[ -z "$COMMIT_HASH" || "$COMMIT_HASH" == "null" ]]; then
  print_error "Failed to fetch commit information"
  exit 1
fi

print_status "Latest commit: $COMMIT_HASH ($COMMIT_DATE)"

# Latest release tag
print_status "Checking for latest release..."
VERSION=$(curl -sL "$API_URL/releases/latest" 2>/dev/null | jq -r '.tag_name // empty')
if [[ -z "$VERSION" || "$VERSION" == "null" ]]; then
  VERSION="main"
  print_warning "No releases found, using '$VERSION'"
else
  print_status "Found latest release: $VERSION"
fi

# --- Clone Repo ---
print_status "Cloning repository..."
cd "$TEMP_DIR"
if ! git clone --depth 1 "$URL.git" repo; then
  print_error "Failed to clone repository"
  exit 1
fi

# --- Prepare Target Directory ---
TARGET_DIR="$APPS_DIR/$REPO"
if [[ -d "$TARGET_DIR" ]]; then
  print_warning "Directory $TARGET_DIR already exists. Removing..."
  rm -rf "$TARGET_DIR"
fi
mkdir -p "$TARGET_DIR/src"

# --- Create Metadata ---
SNAPSHOT_DATE=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
cat > "$TARGET_DIR/.snapshot.json" <<EOF
{
  "url": "$URL",
  "owner": "$OWNER",
  "repo": "$REPO",
  "commit": "$COMMIT_HASH",
  "version": "$VERSION",
  "snapshotDate": "$SNAPSHOT_DATE"
}
EOF

# --- Copy Files ---
print_status "Copying source files..."
cd "$TEMP_DIR/repo"
rsync -a --quiet \
  --exclude='.git' \
  --exclude='.github' \
  --exclude='node_modules' \
  --exclude='.DS_Store' \
  --exclude='*.log' \
  --exclude='.npm' \
  --exclude='.cache' \
  ./ "$TARGET_DIR/src/"

# --- Optional: Create Archive ---
ARCHIVE_NAME="${TARGET_DIR}-${COMMIT_HASH}.tar.gz"
tar -czf "$ARCHIVE_NAME" -C "$APPS_DIR" "$REPO" >/dev/null 2>&1 && \
  print_status "Created archive: $ARCHIVE_NAME"

# --- Summary ---
print_status "✅ Snapshot created successfully"
echo "📦 Repository : $OWNER/$REPO"
echo "🏷  Version    : $VERSION"
echo "🔗 Commit     : $COMMIT_HASH"
echo "📂 Files      : $TARGET_DIR/src/"
echo "📝 Metadata   : $TARGET_DIR/.snapshot.json"
echo "📜 Archive    : $ARCHIVE_NAME"
