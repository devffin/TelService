#!/bin/bash

whereis python3 &> /dev/null
if [ $? -eq 0 ]; then
    echo "Python3 is already installed."
else
    whereis apt &> /dev/null
    if [ $? -ne 1 ]; then
        echo "Installing Python3..."
        sudo apt update
        sudo apt install python3 -y
        sudo apt install python3-pip -y
        python3 -m pip install yt-dlp --break-system-packages
    else
        whereis dnf &> /dev/null
        if [ $? -ne 1 ]; then
            echo "Installing Python3..."
            sudo dnf install python3 -y
            sudo dnf install python3-pip -y
            python3 -m pip install yt-dlp --break-system-packages
        else
            echo "Neither apt nor dnf package manager found. Please install Python3 and pip manually."
        fi
    fi
fi
        
        