# Quick Start Guide

## Running the Nutrient Deficiency Detection Project

This guide will help you get the project running quickly.

### Prerequisites
- Python 3.8+ installed
- Git (to clone the repository)

### Quick Setup (5 minutes)

#### On Linux/Mac:
```bash
# 1. Run the setup script
./setup.sh

# 2. Train or obtain the model (see below)

# 3. Run the application
./run.sh
```

#### On Windows:
```batch
REM 1. Run the setup script
setup.bat

REM 2. Train or obtain the model (see below)

REM 3. Run the application
run.bat
```

### Manual Setup

If you prefer to set up manually:

```bash
# Create virtual environment
python3 -m venv venv

# Activate virtual environment
source venv/bin/activate  # Linux/Mac
# or
venv\Scripts\activate  # Windows

# Install dependencies
pip install -r requirements.txt

# Run the application
streamlit run predictions.py
```

### Getting the Model File

The application requires a trained model file named `weights.hdf5`. You have two options:

#### Option 1: Train Your Own Model (Recommended)

1. **Choose a notebook** from the repository:
   - `Xception 93%.ipynb` - Best accuracy (93%)
   - `VGG 92% F2 Score.ipynb` - Good F2 score
   - `Inception V3.ipynb` - Transfer learning
   - `Custom Model.ipynb` - Custom architecture

2. **Open the notebook** in Jupyter Lab, Google Colab, or VS Code

3. **Run all cells** to train the model

4. **Save the model** - The notebook will save it as `weights.hdf5`

5. **Copy to project root** if not already there

#### Option 2: Use a Pre-trained Model

If you have access to a pre-trained model:
1. Download the `weights.hdf5` file
2. Place it in the project root directory

### Using the Application

1. **Start the app**: The application will open in your browser at `http://localhost:8501`

2. **Upload an image**: Click "Browse files" and select a plant image (PNG, JPG, or JPEG)

3. **Get prediction**: Click "Predict" to classify the nutrient deficiency

4. **View results**: The app will display:
   - Uploaded image
   - File details
   - Prediction result (Healthy, N_Deficiency, P_Deficiency, or K_Deficiency)

### Troubleshooting

**Problem**: Model file not found
```
Solution: Train a model using one of the notebooks or obtain a pre-trained weights.hdf5 file
```

**Problem**: Package installation fails
```
Solution: 
pip install --upgrade pip
pip install -r requirements.txt --no-cache-dir
```

**Problem**: Port 8501 already in use
```
Solution: Stop other Streamlit apps or use a different port:
streamlit run predictions.py --server.port 8502
```

**Problem**: Out of memory
```
Solution: The app uses tensorflow-cpu for lower memory usage. 
Ensure you have at least 4GB RAM available.
```

### Testing Without a Model

If you want to test the app interface without a model:
- Start the app with `streamlit run predictions.py`
- The app will display a helpful error message explaining how to get the model
- This confirms the app is working, just needs the model file

### Next Steps

- **Explore the notebooks** to understand how models are trained
- **Try different models** to compare performance
- **Customize the UI** by modifying `predictions.py`
- **Add more deficiency types** by retraining with additional data

### Support

For issues or questions:
- Check the main README.md for detailed documentation
- Review the Jupyter notebooks for training examples
- Open an issue on GitHub

### Quick Command Reference

```bash
# Setup
./setup.sh              # Linux/Mac
setup.bat               # Windows

# Run
./run.sh                # Linux/Mac  
run.bat                 # Windows

# Manual run
streamlit run predictions.py

# Stop the app
Ctrl+C
```

That's it! You're ready to start detecting nutrient deficiencies in plants! 🌱
