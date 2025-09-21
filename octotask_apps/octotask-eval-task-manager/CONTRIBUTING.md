# Contributing to OctoTask Eval Task Manager

Thank you for your interest in contributing to OctoTask Eval Task Manager! We appreciate your time and effort in making this project better.

## 📋 Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#-getting-started)
- [Development Workflow](#-development-workflow)
- [Pull Request Process](#-pull-request-process)
- [Coding Standards](#-coding-standards)
- [Testing](#-testing)
- [Documentation](#-documentation)
- [Reporting Issues](#-reporting-issues)
- [Feature Requests](#-feature-requests)
- [License](#-license)

## Code of Conduct

This project and everyone participating in it is governed by our [Code of Conduct](CODE_OF_CONDUCT.md). By participating, you are expected to uphold this code.

## 🚀 Getting Started

1. **Fork the repository**
2. **Clone your fork**
   ```bash
   git clone https://github.com/your-username/octotask-eval-task-manager.git
   cd octotask-eval-task-manager
   ```
3. **Install dependencies**
   ```bash
   npm install
   ```
4. **Set up environment variables** (see `.env.example`)
5. **Start the development server**
   ```bash
   npm run dev
   ```

## 🔄 Development Workflow

1. **Create a feature branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. **Make your changes**
   - Follow our coding standards
   - Write tests for new features
   - Update documentation as needed

3. **Run tests**
   ```bash
   npm test
   ```

4. **Commit your changes**
   ```bash
   git add .
   git commit -m "feat: add your feature"
   ```

5. **Push to your fork**
   ```bash
   git push origin feature/your-feature-name
   ```

6. **Open a Pull Request**
   - Fill out the PR template
   - Reference any related issues
   - Request reviews from maintainers

## 🔍 Pull Request Process

1. Ensure any install or build dependencies are removed before the end of the layer when doing a build.
2. Update the README.md with details of changes to the interface, including new environment variables, exposed ports, useful file locations, and container parameters.
3. Increase the version numbers in any example files and the README.md to the new version that this Pull Request would represent.
4. The PR will be reviewed by the maintainers and may require changes before being merged.

## 🎨 Coding Standards

- **TypeScript**: Use TypeScript for all new code
- **Linting**: Follow ESLint rules (run `npm run lint` to check)
- **Formatting**: Use Prettier (configured in `.prettierrc`)
- **Imports**: Use absolute imports when possible
- **Components**: Use functional components with TypeScript interfaces
- **Styling**: Use Tailwind CSS utility classes

## 🧪 Testing

- Write unit tests for all new features
- Ensure all tests pass before submitting a PR
- Follow the testing patterns used in existing tests
- Aim for good test coverage (80%+)

### Running Tests

```bash
# Run all tests
npm test

# Run tests in watch mode
npm test -- --watch

# Run tests with coverage
npm run test:coverage
```

## 📚 Documentation

- Update documentation for any new features or changes
- Keep JSDoc comments up to date
- Add examples for complex components
- Document any breaking changes

## 🐛 Reporting Issues

When reporting issues, please include:

1. A clear, descriptive title
2. Steps to reproduce the issue
3. Expected vs. actual behavior
4. Any relevant error messages
5. Browser/OS version if applicable

## ✨ Feature Requests

We welcome feature requests! Please:

1. Check if a similar feature already exists
2. Explain why this feature would be valuable
3. Include any relevant use cases

## 📝 License

By contributing, you agree that your contributions will be licensed under the [MIT License](LICENSE).
