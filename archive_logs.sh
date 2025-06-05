#!/bin/bash

# Define log files and archive directories
HEART_LOG="hospital_data/active_logs/heart_rate_log.log"
TEMP_LOG="hospital_data/active_logs/temperature_log.log"
WATER_LOG="hospital_data/active_logs/water_usage_log.log"

HEART_ARCHIVE_DIR="hospital_data/archived_logs/heart_data_archive"
TEMP_ARCHIVE_DIR="hospital_data/archived_logs/temperature_data_archive"
WATER_ARCHIVE_DIR="hospital_data/archived_logs/water_data_archive"

# Function to archive log file
archive_log() {
    local log_file=$1
    local archive_dir=$2
    local base_name=$3  # e.g., heart_rate_log

    # Check if log file exists
    if [[ ! -f "$log_file" ]]; then
        echo "Error: Log file '$log_file' not found."
        exit 1
    fi

    # Check if archive directory exists; create if missing
    if [[ ! -d "$archive_dir" ]]; then
        echo "Archive directory '$archive_dir' does not exist. Creating it now..."
        mkdir -p "$archive_dir"
        if [[ $? -ne 0 ]]; then
            echo "Error: Failed to create archive directory '$archive_dir'."
            exit 1
        fi
    fi

    # Create timestamp
    timestamp=$(date +"%Y-%m-%d_%H:%M:%S")

    # Define archive filename with timestamp
    archive_file="${archive_dir}/${base_name}_${timestamp}.log"

    echo "Archiving $log_file..."
    mv "$log_file" "$archive_file"

    if [[ $? -ne 0 ]]; then
        echo "Error: Failed to move log file to archive."
        exit 1
    fi

    # Create a new empty log file
    touch "$log_file"
    if [[ $? -ne 0 ]]; then
        echo "Error: Failed to create new log file '$log_file'."
        exit 1
    fi

    echo "Successfully archived to '$archive_file'."
}

# Main menu for user selection
echo "Select log to archive:"
echo "1) Heart Rate"
echo "2) Temperature"
echo "3) Water Usage"
read -p "Enter choice (1-3): " choice

case "$choice" in
    1)
        archive_log "$HEART_LOG" "$HEART_ARCHIVE_DIR" "heart_rate_log"
        ;;
    2)
        archive_log "$TEMP_LOG" "$TEMP_ARCHIVE_DIR" "temperature_log"
        ;;
    3)
        archive_log "$WATER_LOG" "$WATER_ARCHIVE_DIR" "water_usage_log"
        ;;
    *)
        echo "Invalid choice. Please enter a number between 1 and 3."
        exit 1
        ;;
esac

