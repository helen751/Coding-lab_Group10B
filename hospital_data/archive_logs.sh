#!/bin/bash

# Set directory where logs are stored
LOG_DIR="active_logs"

#files to be logged
LOG_FILES=("heart_rate_log.log" "temperature_log.log" "water_usage_log.log")

#select menu
echo " Choose log file to archive:"
#iteratively list the log files
for i in "${!LOG_FILES[@]}"; do
  printf "%d) %s\n" "$((i+1))" "${LOG_FILES[$i]}"
done

# Prompt user input
read -rp "Enter the number of your choice: " choice

if [[ "$choice" =~ ^[1-3]$ ]]; then
  selected_log="${LOG_FILES[$((choice-1))]}"
  
  # Check if the log file exists
  if [[ ! -f "$selected_log" ]]; then
    echo "Error: '$selected_log' does not exist."
    exit 1
  fi

  # Archive the log file
  timestamp=$(date +"%Y%m%d-%H%M%S")
  archive_name="${selected_log%.log}-$timestamp.tar.gz"
  tar -czf "$archive_name" "$selected_log"

  echo "Archived '$selected_log' to '$archive_name'"
else
  echo "Invalid choice. Please run the script again and select a valid number."
  exit 1
fi