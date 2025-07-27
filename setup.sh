#!/bin/bash
# Setup script for Linux/macOS

echo "Setting up Gobel Battery Monitor..."

# Create virtual environment
python3 -m venv venv

# Activate virtual environment
source venv/bin/activate

# Install dependencies
pip install -r requirements.txt

echo "Setup complete! To run the application:"
echo "1. Activate the virtual environment: source venv/bin/activate"
echo "2. Run the application: python main.py" 