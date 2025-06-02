#!/bin/bash

# Set directory where active logs are stored
LOG_DIR="active_logs"
#directory to store the newly archived file:
ARCHIVE_DIR="archived_logs"
# Ensure archive directory exists
mkdir -p "$ARCHIVE_DIR"


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
  full_path="$LOG_DIR/$selected_log"
  
  # Check if the log file exists
  if [[ ! -f "$full_path" ]]; then
    echo "Error: '$selected_log' does not exist."
    exit 1
  fi

  # Create archive name
  timestamp=$(date +"%Y%m%d-%H%M%S")                         # timestamp
  archive_name="${selected_log%.log}-$timestamp.tar.gz"     #archive name

 # Create archive in ARCHIVE_DIR
  tar -czf "$ARCHIVE_DIR/$archive_name" -C "$LOG_DIR" "$selected_log"

  echo "Archived '$selected_log' to '$ARCHIVE_DIR/$archive_name'"
else
  echo "Invalid choice. Please run the script again and select a valid number."
  exit 1
fi