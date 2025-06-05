#!/bin/bash

# Set directory where active logs are stored
LOG_DIR="active_logs"
#directory to store the newly archived file:
ARCHIVE_DIR="archived_logs"
# Ensure archive directory exists
mkdir -p "$ARCHIVE_DIR"


#files to be logged
LOG_FILES=("heart_rate_log.log" "temperature_log.log" "water_usage_log.log")

#welcome Menu
echo -e "\n \t WELCOME TO GROUP10 AUTOMATED LOG MANAGEMENT SYSTEM \n"
sleep 1

#select menu
echo " Choose log file to archive:"

#iteratively list the log files
for i in "${!LOG_FILES[@]}"; do
  printf "%d) %s\n" "$((i+1))" "${LOG_FILES[$i]}"
done

# Prompt user input
read -rp "Enter the number of your choice [1-3]: " choice


#get user choice and check if it is between 1-3
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
  archive_name="${selected_log%.log}-$timestamp.log"     #archive name
  
  # Determine correct subdirectory using if statements
  if [[ "$selected_log" == "heart_rate_log.log" ]]; then
    DEST_DIR="$ARCHIVE_DIR/heart_data_archive"
  elif [[ "$selected_log" == "temperature_log.log" ]]; then
    DEST_DIR="$ARCHIVE_DIR/temperature_data_archive"
  elif [[ "$selected_log" == "water_usage_log.log" ]]; then
    DEST_DIR="$ARCHIVE_DIR/water_usage_data_archive"
  else
    echo "Unknown log file. Cannot determine archive folder."
    exit 1
  fi

# Ensure the destination directory exists
  mkdir -p "$DEST_DIR"

 # Create archive in ARCHIVE_DIR
  echo -e "\n \t  Archiving '$selected_log'..."
  sleep 2 

   # Move and rename the log file
  mv "$full_path" "$DEST_DIR/$archive_name"

  # Create new empty log file
  touch "$full_path"

  echo -e "\n Successfully Archived '$selected_log' to '$DEST_DIR/$archive_name'\n"
else
  echo -e "\n \t  PROCESSING..."
  sleep 1
  echo -e "\n Invalid choice. Please run the script again and select a valid number.\n"
  exit 1
fi
