@echo off
REM Setup script for Nutrient Deficiency Detection Project (Windows)

echo ==========================================
echo Nutrient Deficiency Detection - Setup
echo ==========================================
echo.

REM Check Python version
echo Checking Python version...
python --version
if %errorlevel% neq 0 (
    echo Error: Python is not installed. Please install Python 3.8 or higher.
    exit /b 1
)

echo.
echo Creating virtual environment...
python -m venv venv
if %errorlevel% neq 0 (
    echo Error: Failed to create virtual environment.
    exit /b 1
)

echo.
echo Activating virtual environment...
call venv\Scripts\activate.bat

echo.
echo Upgrading pip...
python -m pip install --upgrade pip

echo.
echo Installing dependencies...
pip install -r requirements.txt

if %errorlevel% neq 0 (
    echo.
    echo Warning: Some packages failed to install. You may need to install them manually.
)

echo.
echo ==========================================
echo Setup Complete!
echo ==========================================
echo.
echo Next steps:
echo 1. Activate the virtual environment: venv\Scripts\activate
echo 2. Ensure you have the model file 'weights.hdf5' in the root directory
echo    - Train a model using one of the provided Jupyter notebooks, or
echo    - Obtain a pre-trained model file
echo 3. Run the application: streamlit run predictions.py
echo.
echo For more information, see README.md
echo.
pause
