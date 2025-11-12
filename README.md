# Nutrient-Deficiency-Detection

A deep learning application for detecting nutrient deficiencies in plants using Convolutional Neural Networks (CNN). This project uses transfer learning with pre-trained models (Xception, VGG, Inception V3) to classify plant images into four categories:
- **Healthy**: No deficiency detected
- **N_Deficiency**: Nitrogen deficiency
- **P_Deficiency**: Phosphorus deficiency
- **K_Deficiency**: Potassium deficiency

## Features

- Web-based interface using Streamlit
- Multiple pre-trained model architectures (Xception achieving 93% accuracy)
- Real-time image classification
- Support for PNG, JPG, and JPEG image formats
- User-friendly interface with image upload and instant predictions

## Prerequisites

- Python 3.8 or higher (tested with Python 3.12)
- pip (Python package manager)
- Virtual environment (recommended)

## Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/Dinesh403-cell/Nutrient-Deficiency-Detection.git
   cd Nutrient-Deficiency-Detection
   ```

2. **Create a virtual environment (recommended)**
   ```bash
   python3 -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   ```

3. **Install required packages**
   ```bash
   pip install -r requirements.txt
   ```

## Model Setup

The application requires a trained model file named `weights.hdf5` in the root directory.

### Option 1: Use a Pre-trained Model
If you have access to a pre-trained model file:
1. Download or obtain the `weights.hdf5` file
2. Place it in the root directory of the project

### Option 2: Train Your Own Model
Use one of the provided Jupyter notebooks to train a model:
- `Xception 93%.ipynb` - Xception model (93% accuracy)
- `VGG 92% F2 Score.ipynb` - VGG model (92% F2 Score)
- `Inception V3.ipynb` - Inception V3 model
- `Custom Model.ipynb` - Custom CNN architecture

To train:
1. Open any of the notebooks in Jupyter Lab or Google Colab
2. Run all cells to train the model
3. The notebook will save the model as `weights.hdf5`
4. Copy the `weights.hdf5` file to the root directory

## Running the Application

1. **Ensure the model file exists**
   ```bash
   ls weights.hdf5  # Should show the file
   ```

2. **Start the Streamlit application**
   ```bash
   streamlit run predictions.py
   ```

3. **Access the application**
   - The app will automatically open in your default browser
   - If not, navigate to: `http://localhost:8501`

4. **Use the application**
   - Click "Browse files" to upload a plant image
   - Click "Predict" to classify the image
   - View the prediction result and uploaded image

## Project Structure

```
Nutrient-Deficiency-Detection/
├── predictions.py              # Main Streamlit application
├── requirements.txt            # Python dependencies
├── weights.hdf5               # Trained model (not included in repo)
├── Xception 93%.ipynb         # Xception model training notebook
├── VGG 92% F2 Score.ipynb     # VGG model training notebook
├── Inception V3.ipynb         # Inception V3 model training notebook
├── Custom Model.ipynb         # Custom model training notebook
└── README.md                   # This file
```

## Model Architecture

The application supports multiple CNN architectures:
- **Xception**: Best performance with 93% accuracy
- **VGG**: 92% F2 Score
- **Inception V3**: Transfer learning approach
- **Custom Model**: Custom CNN architecture

All models are trained to classify plant images into 4 categories using transfer learning from ImageNet pre-trained weights.

## Troubleshooting

### Model file not found
**Error**: `FileNotFoundError: weights.hdf5`
**Solution**: Train a model using one of the provided notebooks or obtain a pre-trained model file.

### Dependency conflicts
**Error**: Package version conflicts
**Solution**: 
```bash
pip install --upgrade pip
pip install -r requirements.txt --no-cache-dir
```

### Streamlit not opening
**Error**: Browser doesn't open automatically
**Solution**: Manually navigate to `http://localhost:8501` in your browser

### Memory issues
**Error**: Out of memory during prediction
**Solution**: The models use tensorflow-cpu for reduced memory footprint. Ensure adequate RAM (minimum 4GB recommended).

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is open source and available for educational and research purposes.

## Acknowledgments

- TensorFlow and Keras teams for the deep learning framework
- Streamlit for the web application framework
- Pre-trained models from ImageNet

## Contact

For questions or issues, please open an issue on the GitHub repository.