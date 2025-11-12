@echo off
REM Run script for Nutrient Deficiency Detection Project (Windows)

echo ==========================================
echo Nutrient Deficiency Detection
echo ==========================================
echo.

REM Check if virtual environment exists
if not exist "venv\" (
    echo Virtual environment not found!
    echo Please run 'setup.bat' first to set up the project.
    exit /b 1
)

REM Activate virtual environment
echo Activating virtual environment...
call venv\Scripts\activate.bat

REM Check if model file exists
if not exist "weights.hdf5" (
    echo.
    echo ==========================================
    echo WARNING: Model file not found!
    echo ==========================================
    echo.
    echo The model file 'weights.hdf5' is required but not found.
    echo.
    echo To train a model:
    echo 1. Open one of the Jupyter notebooks:
    echo    - Xception 93%%.ipynb ^(recommended^)
    echo    - VGG 92%% F2 Score.ipynb
    echo    - Inception V3.ipynb
    echo    - Custom Model.ipynb
    echo 2. Run all cells to train the model
    echo 3. The model will be saved as 'weights.hdf5'
    echo.
    echo The application will start, but you'll need the model file to make predictions.
    echo.
    pause
)

REM Check if streamlit is installed
python -c "import streamlit" 2>nul
if %errorlevel% neq 0 (
    echo.
    echo Streamlit is not installed. Installing dependencies...
    pip install -r requirements.txt
)

echo.
echo Starting Streamlit application...
echo The app will open in your default browser at http://localhost:8501
echo.
echo Press Ctrl+C to stop the application.
echo.

streamlit run predictions.py
