#!/bin/bash

# Setup script for Nutrient Deficiency Detection Project

echo "=========================================="
echo "Nutrient Deficiency Detection - Setup"
echo "=========================================="
echo ""

# Check Python version
echo "Checking Python version..."
python3 --version
if [ $? -ne 0 ]; then
    echo "Error: Python 3 is not installed. Please install Python 3.8 or higher."
    exit 1
fi

echo ""
echo "Creating virtual environment..."
python3 -m venv venv
if [ $? -ne 0 ]; then
    echo "Error: Failed to create virtual environment."
    exit 1
fi

echo ""
echo "Activating virtual environment..."
source venv/bin/activate

echo ""
echo "Upgrading pip..."
pip install --upgrade pip

echo ""
echo "Installing dependencies..."
pip install -r requirements.txt

if [ $? -ne 0 ]; then
    echo ""
    echo "Warning: Some packages failed to install. You may need to install them manually."
fi

echo ""
echo "=========================================="
echo "Setup Complete!"
echo "=========================================="
echo ""
echo "Next steps:"
echo "1. Activate the virtual environment: source venv/bin/activate"
echo "2. Ensure you have the model file 'weights.hdf5' in the root directory"
echo "   - Train a model using one of the provided Jupyter notebooks, or"
echo "   - Obtain a pre-trained model file"
echo "3. Run the application: streamlit run predictions.py"
echo ""
echo "For more information, see README.md"
echo ""
