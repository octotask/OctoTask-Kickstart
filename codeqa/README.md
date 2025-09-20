# CodeQA Snapshot System

This directory contains frozen snapshots of open source applications used for code evaluation and analysis.

## Directory Structure

```
codeqa/
├── snapshot.sh           # Script to create new snapshots
├── README.md            # Documentation
└── apps/                # Snapshot storage
    └── <repo-name>/    # Each repository gets its own directory
        ├── .snapshot.json  # Metadata about the snapshot
        ├── .qa.json       # Questions and answers (optional)
        └── src/           # Pristine source code
```

## Creating Snapshots

Use the `snapshot.sh` script to create a new snapshot of a GitHub repository:

```bash
./codeqa/snapshot.sh https://github.com/owner/repository
```

### Example

```bash
./codeqa/snapshot.sh https://github.com/webtorrent/webtorrent
```

This creates:

```
codeqa/apps/webtorrent/
├── .snapshot.json
├── .qa.json (optional)
└── src/
    ├── package.json
    ├── lib/
    └── ...
```

## Snapshot Metadata

Each snapshot includes a `.snapshot.json` file with complete traceability information:

```json
{
  "url": "https://github.com/webtorrent/webtorrent",
  "owner": "webtorrent",
  "repo": "webtorrent",
  "commit": "a1b2c3d",
  "version": "2.4.0",
  "snapshotDate": "2024-09-03T15:30:00Z"
}
```

## Excluded Files

The snapshot process excludes common development artifacts:

* `.git/`
* `.github/`
* `node_modules/`
* `.DS_Store`
* `*.log`
* `.npm/`, `.cache/`

## Tracing Original Repositories

1. Check the `.snapshot.json` file in the app directory
2. `url` field contains the original GitHub repository
3. `commit` field shows the exact commit
4. `version` field shows the release version (or "main" if no releases)

## Questions and Answers (.qa.json)

Optional `.qa.json` file format:

```json
{
  "questions": [
    {
      "id": "example-001",
      "question": "What is the main entry point for this application?",
      "answer": "index.js",
      "difficulty": 1,
      "tags": ["architecture"],
      "type": "factual",
      "files": ["index.js"]
    }
  ]
}
```

### Q\&A Guidelines

* **answers**: direct and simple (avoid long explanations)
* **difficulty**: 1-5 (1=basic, 5=expert)
* **tags**: relevant topics
* **type**: `factual` or `conceptual`
* **files**: relevant source files relative to `src/`
* **id**: unique identifier

## Purpose

These snapshots provide:

* Stable references for evaluation platforms
* Frozen codebases without development artifacts
* Full traceability
* Consistent structure for automated analysis
* Optional Q\&A datasets for evaluation
