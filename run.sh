#!/bin/bash
echo "==========================================="
echo "  Starting Local Mac Model Guide Server... "
echo "==========================================="

# Check if Flask is installed, if not, install it
python3 -c "import flask" 2>/dev/null
if [ $? -ne 0 ]; then
    echo "Flask is not installed. Installing Flask and requests..."
    pip3 install flask requests
else
    echo "Dependencies are already installed."
fi

# Run the app
python3 app.py
