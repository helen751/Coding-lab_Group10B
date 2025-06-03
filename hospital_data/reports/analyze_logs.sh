#!/bin/bash
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
        echo "$device appears $count_number_of_occurance times in the heart_rate_log.log file"

        first_timestamp=$(awk -v device="$device" 'device == $3 {print $1, $2 }' "$file_name" | head -n 1)
        echo "$device first monitored on $first_timestamp"

        last_timestamp=$(awk -v device="$device" 'device == $3 {print $1, $2 }' "$file_name" | tail -n 1)
        echo "$device last monitored on $last_timestamp"
        echo 
    done
}



analyze_temperature() {
    file_name="hospital_data/active_logs/temperature.log"

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
        echo "$device appears $count_number_of_occurance times in the temperature.log file"
        done

        first_timestamp=$(awk -v device="$device" 'device == $3 {print $1, $2 }' "$file_name" | head -n 1)
        echo "$device first monitored on $first_timestamp"

        last_timestamp=$(awk -v device="$device" 'device == $3 {print $1, $2 }' "$file_name" | tail -n 1)
        echo "$device last monitored on $last_timestamp"
        echo 
    done
}
# analyze_water_usage() {}




echo "Select log file to analyze:"
echo "1) Heart Rate (heart_rate.log)"
echo "2) Temperature (temperature.log)"
echo "3) Water Usage (water_usage.log)"

read -p "Enter choice (1-3):" input

case $input in
"1")
    echo "You made the first choice!"
    analyze_heart_rate
    ;;
"2")
    echo "You made the second choice!"
    analyze_temperature
    ;;
"3")
    echo "You made the third choice!"
    analyze_water_usage
    ;;
*)
    echo "Invalid choice. Please choose 1, 2, or 3."
    exit 1
    ;;
esac


