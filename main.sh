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
restore_server() {
    echo "Checking status..."

    restore_scripts=(
        "restore/mysterium.sh"
        # "install/nodejs.sh"
        # Add more dependency scripts here
    )
    
    for script in "${restore_scripts[@]}"; do
        echo "Running $script..."
        bash "$script"
        if [ $? -ne 0 ]; then
            echo "Error: Failed to install dependencies."
            exit 1
        fi
        echo "Completed $script."
    done

    echo "Status checked."
}

# Main script
echo "What do you want to do?"
echo "[1] Install dependencies"
echo "[2] Start project"
echo "[3] Restore server"

read -p "Enter your choice: " choice

case $choice in
    1)
        install_dependencies
        ;;
    2)
        start_project
        ;;
    3)
        restore_server
        ;;
    *)
        echo "Invalid choice. Exiting."
        ;;
esac
