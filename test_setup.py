#!/usr/bin/env python3
"""
Simple test to verify the predictions.py module can be imported.
This doesn't test the full functionality, just basic syntax and imports.
"""

import sys
import ast

def test_syntax():
    """Test if predictions.py has valid Python syntax."""
    print("Testing predictions.py syntax...")
    try:
        with open('predictions.py', 'r') as f:
            code = f.read()
        ast.parse(code)
        print("✓ Syntax is valid")
        return True
    except SyntaxError as e:
        print(f"✗ Syntax error: {e}")
        return False

def test_imports():
    """Test if basic imports work."""
    print("\nTesting basic imports...")
    try:
        import numpy as np
        print("✓ numpy imported")
        import pandas as pd
        print("✓ pandas imported")
        from sklearn.base import BaseEstimator, TransformerMixin
        print("✓ sklearn imported")
        from sklearn.pipeline import Pipeline
        print("✓ sklearn.pipeline imported")
        from PIL import Image
        print("✓ PIL imported")
        return True
    except ImportError as e:
        print(f"✗ Import error: {e}")
        print("\nPlease install dependencies:")
        print("  pip install -r requirements.txt")
        return False

def test_streamlit():
    """Test if streamlit is installed."""
    print("\nTesting Streamlit...")
    try:
        import streamlit as st
        print("✓ Streamlit imported")
        return True
    except ImportError:
        print("✗ Streamlit not found")
        print("\nPlease install Streamlit:")
        print("  pip install streamlit")
        return False

def main():
    """Run all tests."""
    print("=" * 50)
    print("Testing Nutrient Deficiency Detection Setup")
    print("=" * 50)
    
    tests = [
        test_syntax(),
        test_imports(),
        test_streamlit()
    ]
    
    print("\n" + "=" * 50)
    if all(tests):
        print("✓ All tests passed!")
        print("\nYou can now run the application:")
        print("  streamlit run predictions.py")
        print("\nNote: You'll need the weights.hdf5 model file to make predictions.")
        return 0
    else:
        print("✗ Some tests failed. Please fix the issues above.")
        return 1

if __name__ == '__main__':
    sys.exit(main())
