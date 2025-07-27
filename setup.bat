@echo off
REM Setup script for Windows

echo Setting up Gobel Battery Monitor...

REM Create virtual environment
python -m venv venv

REM Activate virtual environment
call venv\Scripts\activate.bat

REM Install dependencies
pip install -r requirements.txt

echo Setup complete! To run the application:
echo 1. Activate the virtual environment: venv\Scripts\activate.bat
echo 2. Run the application: python main.py

pause 