#!/bin/bash

# Run script for Nutrient Deficiency Detection Project

echo "=========================================="
echo "Nutrient Deficiency Detection"
echo "=========================================="
echo ""

# Check if virtual environment exists
if [ ! -d "venv" ]; then
    echo "Virtual environment not found!"
    echo "Please run './setup.sh' first to set up the project."
    exit 1
fi

# Activate virtual environment
echo "Activating virtual environment..."
source venv/bin/activate

# Check if model file exists
if [ ! -f "weights.hdf5" ]; then
    echo ""
    echo "=========================================="
    echo "WARNING: Model file not found!"
    echo "=========================================="
    echo ""
    echo "The model file 'weights.hdf5' is required but not found."
    echo ""
    echo "To train a model:"
    echo "1. Open one of the Jupyter notebooks:"
    echo "   - Xception 93%.ipynb (recommended)"
    echo "   - VGG 92% F2 Score.ipynb"
    echo "   - Inception V3.ipynb"
    echo "   - Custom Model.ipynb"
    echo "2. Run all cells to train the model"
    echo "3. The model will be saved as 'weights.hdf5'"
    echo ""
    echo "The application will start, but you'll need the model file to make predictions."
    echo ""
    read -p "Press Enter to continue anyway..."
fi

# Check if streamlit is installed
python3 -c "import streamlit" 2>/dev/null
if [ $? -ne 0 ]; then
    echo ""
    echo "Streamlit is not installed. Installing dependencies..."
    pip install -r requirements.txt
fi

echo ""
echo "Starting Streamlit application..."
echo "The app will open in your default browser at http://localhost:8501"
echo ""
echo "Press Ctrl+C to stop the application."
echo ""

streamlit run predictions.py
