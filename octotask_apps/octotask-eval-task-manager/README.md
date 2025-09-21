# 🚀 OctoTask Eval Task Manager

A modern, responsive task management application built with React, TypeScript, and Tailwind CSS, designed for evaluating task management workflows.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![React](https://img.shields.io/badge/React-18.2.0-61DAFB?logo=react)](https://reactjs.org/)
[![TypeScript](https://img.shields.io/badge/TypeScript-5.0.0-3178C6?logo=typescript)](https://www.typescriptlang.org/)
[![Vite](https://img.shields.io/badge/Vite-5.0.0-646CFF?logo=vite)](https://vitejs.dev/)
[![Tailwind CSS](https://img.shields.io/badge/Tailwind_CSS-3.4.1-06B6D4?logo=tailwind-css)](https://tailwindcss.com/)

## ✨ Features

- 🎨 Beautiful, responsive UI with dark/light mode
- 🧩 Drag-and-drop task management
- 🔒 Secure authentication with Supabase
- ⚡ Real-time updates
- 📱 Mobile-first design
- 🛠 Developer-friendly with TypeScript support

## 🚀 Quick Start

### Prerequisites

- Node.js 18+
- npm or yarn
- Supabase account

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-org/octotask-eval-task-manager.git
   cd octotask-eval-task-manager
   ```

2. **Install dependencies**
   ```bash
   npm install
   # or
   yarn
   ```

3. **Set up environment variables**
   ```bash
   cp .env.example .env.local
   # Update the values in .env.local with your Supabase credentials
   ```

4. **Start the development server**
   ```bash
   npm run dev
   # or
   yarn dev
   ```

5. **Open in browser**
   ```
   http://localhost:5173
   ```

## 🧪 Testing

Run the test suite with:

```bash
# Unit tests
npm test

# E2E tests
npm run test:e2e

# Test coverage
npm run test:coverage
```

## 🏗 Project Structure

```
src/
├── assets/            # Static assets
├── components/        # Reusable UI components
│   ├── auth/         # Authentication components
│   ├── board/        # Board and task components
│   ├── common/       # Shared components
│   └── layout/       # Layout components
├── hooks/            # Custom React hooks
├── lib/              # Utility functions and configs
│   ├── api/         # API client and services
│   └── utils/       # Helper functions
├── types/            # TypeScript type definitions
├── App.tsx           # Main application component
└── main.tsx          # Application entry point
```

## 🛠 Development

### Code Style

This project uses:
- ESLint for code linting
- Prettier for code formatting
- TypeScript for type safety

### Git Workflow

1. Create a new branch for your feature:
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. Make your changes and commit them:
   ```bash
   git add .
   git commit -m "feat: add your feature"
   ```

3. Push your changes and create a pull request

### Commit Message Format

This project uses [Conventional Commits](https://www.conventionalcommits.org/):

- `feat:` A new feature
- `fix:` A bug fix
- `docs:` Documentation only changes
- `style:` Changes that don't affect the meaning of the code
- `refactor:` A code change that neither fixes a bug nor adds a feature
- `perf:` A code change that improves performance
- `test:` Adding missing tests or correcting existing tests
- `chore:` Changes to the build process or auxiliary tools

## 🤝 Contributing

Contributions are welcome! Please read our [Contributing Guide](CONTRIBUTING.md) for details on our code of conduct and the process for submitting pull requests.

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Built with [Vite](https://vitejs.dev/)
- Styled with [Tailwind CSS](https://tailwindcss.com/)
- Icons by [Lucide](https://lucide.dev/)
- State Management with [React Query](https://tanstack.com/query)
- Backend by [Supabase](https://supabase.com/)
