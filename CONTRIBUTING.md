# Contributing to Nutrient Deficiency Detection

Thank you for your interest in contributing to this project! This guide will help you understand how to contribute effectively.

## Project Overview

This project uses deep learning to detect nutrient deficiencies in plants. It consists of:
- Jupyter notebooks for training models
- A Streamlit web application for predictions
- Supporting scripts for setup and deployment

## Ways to Contribute

### 1. Improve Model Performance
- Train models with different architectures
- Experiment with hyperparameters
- Add new preprocessing techniques
- Document your results in the notebooks

### 2. Enhance the Web Application
- Improve the UI/UX
- Add new features (batch prediction, export results, etc.)
- Optimize performance
- Add unit tests

### 3. Documentation
- Improve README and guides
- Add code comments
- Create tutorials
- Fix typos and errors

### 4. Bug Fixes
- Report bugs with detailed information
- Submit fixes with test cases
- Improve error handling

## Development Setup

1. Fork the repository
2. Clone your fork:
   ```bash
   git clone https://github.com/YOUR_USERNAME/Nutrient-Deficiency-Detection.git
   cd Nutrient-Deficiency-Detection
   ```
3. Run setup:
   ```bash
   ./setup.sh  # or setup.bat on Windows
   ```
4. Create a new branch:
   ```bash
   git checkout -b feature/your-feature-name
   ```

## Code Style

- Follow PEP 8 for Python code
- Use meaningful variable names
- Add docstrings to functions
- Keep functions focused and small
- Comment complex logic

## Testing Your Changes

Before submitting a pull request:

1. **Test the setup scripts**:
   ```bash
   ./setup.sh
   ```

2. **Test the application**:
   ```bash
   streamlit run predictions.py
   ```

3. **Verify predictions work** (if you have a model):
   - Upload test images
   - Check predictions are reasonable
   - Ensure no errors occur

4. **Check for syntax errors**:
   ```bash
   python3 -m py_compile predictions.py
   ```

## Submitting Changes

1. **Commit your changes**:
   ```bash
   git add .
   git commit -m "Brief description of changes"
   ```

2. **Push to your fork**:
   ```bash
   git push origin feature/your-feature-name
   ```

3. **Create a Pull Request**:
   - Go to the original repository
   - Click "New Pull Request"
   - Select your branch
   - Describe your changes clearly
   - Link any related issues

## Pull Request Guidelines

A good pull request should:
- Have a clear title and description
- Reference related issues
- Include only relevant changes
- Pass all tests
- Update documentation if needed
- Be reasonably sized (not too large)

## Training New Models

If you're contributing a new model:

1. **Create a new notebook** or update existing ones
2. **Document your approach**:
   - Architecture details
   - Hyperparameters
   - Training process
   - Results and metrics
3. **Save the model** as `weights.hdf5` or with a descriptive name
4. **Update predictions.py** if needed for the new model
5. **Document performance** in your PR

## Adding Features to the Web App

When adding features:

1. **Keep it simple**: Don't overcomplicate the UI
2. **Maintain compatibility**: Ensure existing features still work
3. **Error handling**: Add appropriate error messages
4. **Performance**: Consider impact on load times
5. **Documentation**: Update README and QUICKSTART

## Reporting Bugs

When reporting bugs, include:
- Python version
- Operating system
- Steps to reproduce
- Expected vs actual behavior
- Error messages (if any)
- Screenshots (if relevant)

## Feature Requests

For feature requests:
- Explain the use case
- Describe the expected behavior
- Suggest implementation if possible
- Discuss why it's valuable

## Code Review Process

All contributions go through code review:
- Maintainers will review your PR
- They may request changes
- Address feedback promptly
- Once approved, your PR will be merged

## Questions?

- Open an issue for questions
- Check existing issues first
- Be respectful and constructive

## License

By contributing, you agree that your contributions will be licensed under the same license as the project.

Thank you for contributing! 🎉
