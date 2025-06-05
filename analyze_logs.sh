#!/bin/bash

output_file="hospital_data/reports/analysis_report.txt"
analyze_heart_rate() {
    file_name="hospital_data/active_logs/heart_rate_log.log"

    # Check if the file exists
    if [ ! -f "$file_name" ]; then
        echo "File not found: $file_name"
        exit 1
    fi

    # Check the devices we have 
     devices=$(awk '{print $3}' "$file_name" | sort | uniq)

    for device in $devices; do
        count_number_of_occurance=$(awk -v device="$device" '$3 == device {count++} END {print count}' "$file_name")
        echo "$device appears $count_number_of_occurance times in the heart_rate_log.log file">>$output_file

        first_timestamp=$(awk -v device="$device" 'device == $3 {print $1, $2 }' "$file_name" | head -n 1)
        echo "$device first monitored on $first_timestamp">>$output_file

        last_timestamp=$(awk -v device="$device" 'device == $3 {print $1, $2 }' "$file_name" | tail -n 1)
        echo "$device last monitored on $last_timestamp">>$output_file
        echo>>$output_file 
    done
}

analyze_temperature() {
    file_name="hospital_data/active_logs/temperature_log.log"

    # Check if the file exists
    if [ ! -f "$file_name" ]; then
        echo "File not found: $file_name"
        exit 1
    fi
       echo "Analysing Temperature Sensors..."
    # Check the devices we have 
     devices=$(awk '{print $3}' "$file_name" | sort | uniq)

    for device in $devices; do
        count_number_of_occurance=$(awk -v device="$device" '$3 == device {count++} END {print count}' "$file_name")
        echo "$device appears $count_number_of_occurance times in the temperature.log file">>$output_file

        first_timestamp=$(awk -v device="$device" 'device == $3 {print $1, $2 }' "$file_name" | head -n 1)
        echo "$device first monitored on $first_timestamp">>$output_file

        last_timestamp=$(awk -v device="$device" 'device == $3 {print $1, $2 }' "$file_name" | tail -n 1)
        echo "$device last monitored on $last_timestamp">>$output_file
        echo>>$output_file
    done
}
analyze_water_usage() {
    file_name="hospital_data/active_logs/water_usage_log.log"

    # Check if the file exists
    if [ ! -f "$file_name" ]; then
        echo "File not found: $file_name"
        exit 1
    fi

    echo "Analysing Water Usage..."
    # Check the devices we have
    devices=$(awk '{print $3}' "$file_name" | sort | uniq)

    for device in $devices; do
        count_number_of_occurrence=$(awk -v device="$device" '$3 == device {count++} END {print count}' "$file_name")
        echo "$device appears $count_number_of_occurrence times in the water_usage.log file">>$output_file

        first_timestamp=$(awk -v device="$device" 'device == $3 {print $1, $2 }' "$file_name" | head -n 1)
        echo "$device first monitored on $first_timestamp">>$output_file

        last_timestamp=$(awk -v device="$device" 'device == $3 {print $1, $2 }' "$file_name" | tail -n 1)
        echo "$device last monitored on $last_timestamp">>$output_file
        echo>>$output_file
    done
}




echo "Select log file to analyze:"
echo "1) Heart Rate (heart_rate.log)"
echo "2) Temperature (temperature.log)"
echo "3) Water Usage (water_usage.log)"

read -p "Enter choice (1-3):" input

case $input in
"1")
    echo "You made the first choice!"
    analyze_heart_rate
    echo "Heart rate log file was successfully analyzed!"
    ;;
"2")
    echo "You made the second choice!"
    analyze_temperature
    echo "Temperature log file was successfully analyzed!"
    ;;
"3")
    echo "You made the third choice!"
    analyze_water_usage
    echo "Water usage log file was successfully analyzed!"
    ;;
*)
    echo "Invalid choice. Please choose 1, 2, or 3."
    exit 1
    ;;
esac


