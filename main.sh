#!/bin/bash

# Function to install dependencies
install_dependencies() {
    echo "Installing dependencies..."
    
    # Array of dependency scripts to execute
    dependency_scripts=(
        "install/docker.sh"
        # "install/nodejs.sh"
        # Add more dependency scripts here
    )
    
    for script in "${dependency_scripts[@]}"; do
        echo "Running $script..."
        bash "$script"
        if [ $? -ne 0 ]; then
            echo "Error: Failed to install dependencies."
            exit 1
        fi
        echo "Completed $script."
    done
    
    echo "Dependencies installed successfully."
}

# Function to start the project
start_project() {
    echo "Starting the project..."
    # Add commands to start the project here
    echo "Project started."
}

# Function to check status
check_status() {
    echo "Checking status..."
    # Add commands to check the status here
    echo "Status checked."
}

# Main script
echo "What do you want to do?"
echo "[1] Install dependencies"
echo "[2] Start project"
echo "[3] Check status"

read -p "Enter your choice: " choice

case $choice in
    1)
        install_dependencies
        ;;
    2)
        start_project
        ;;
    3)
        check_status
        ;;
    *)
        echo "Invalid choice. Exiting."
        ;;
esac
