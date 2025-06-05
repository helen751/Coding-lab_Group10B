# Task 1: Interactive Archival Script (archive_logs.sh)

# 📦 Group10 Automated Log Management System

This Bash script automates the process of **archiving hospital log files** such as heart rate, temperature, and water usage logs. It is designed to:
- Prompt the user to select a log file to archive.
- Move and rename the selected log file with a timestamp.
- Create a new, empty version of the original log file.
- Organize archived logs into categorized subdirectories.

---

## 🧰 File Structure

```
hospital_data/
├── active_logs/
│   ├── heart_rate_log.log
│   ├── temperature_log.log
│   └── water_usage_log.log
└── archived_logs/
    ├── heart_data_archive/
    ├── temperature_data_archive/
    └── water_usage_data_archive/
```

---

## 🚀 Features

- Interactive selection of which log to archive.
- Timestamped archive file names (e.g., `heart_rate_log-20250605-143015.log`).
- Logs are moved to clearly named folders based on their type.
- Original log file is replaced with a new, empty file (preserves file path for other systems).
- Directory structure is created automatically if it doesn’t exist.

---

## 🖥️ How to Use

1. Ensure the script is executable:
   ```bash
   chmod +x archive_logs.sh
   ```

2. Run the script:
   ```bash
   ./archive_logs.sh
   ```

3. Follow the on-screen menu:
   ```
   Choose log file to archive:
   1) heart_rate_log.log
   2) temperature_log.log
   3) water_usage_log.log
   ```

4. Enter a number (1–3) to select which file to archive.

---

## 📂 What Happens During Archiving?

If you select `heart_rate_log.log`, the script will:

- Move `hospital_data/active_logs/heart_rate_log.log` to  
  `hospital_data/archived_logs/heart_data_archive/heart_rate_log-YYYYMMDD-HHMMSS.log`

- Then, it creates a **new empty** `heart_rate_log.log` back in the `active_logs` directory.

---

## ⚠️ Notes

- If the selected log file does not exist, the script will display an error and exit.
- If an invalid option is selected, the script will ask you to re-run it.

---

## ✅ Example Output

```text
WELCOME TO GROUP10 AUTOMATED LOG MANAGEMENT SYSTEM

Choose log file to archive:
1) heart_rate_log.log
2) temperature_log.log
3) water_usage_log.log
Enter the number of your choice [1-3]: 1

    Archiving 'heart_rate_log.log'...

Successfully Archived 'heart_rate_log.log' to 'hospital_data/archived_logs/heart_data_archive/heart_rate_log-20250605-153000.log'
```

# Task 2: Intelligent Analysis Script (analyze_logs.sh)

In this task we created the `analyze_logs.sh` which is used to analyse different data logs.
The user is prompted to make 1 of the 3 choices via this message:

```bash
    Select log file to analyze:
    1) Heart Rate (heart_rate.log)
    2) Temperature (temperature.log)
    3) Water Usage (water_usage.log)
    Enter choice (1-3):
```

To process the user's choice, we used case statement. If the user enter anything other than 1, 2 or 3, we tell them that they've made an invalid choice. Case statement in this case simplifies it much better.

```bash
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
```

To easily manage our script, we broke down the logic into 3 different functions `analyze_heart_rate`, `analyze_temperature`and `analyze_water_usage`.
They all work in a similar way.

## analyze_heart_rate

In this function, we perform a series of tasks. But before doing that, we first check if the heart_rate_log.log file exists. If it doesn't, we crash the app and prompt the user to re-run it. This gives the user a chance to resolve the issue before trying again. After making sure that the file exists, we:

1. Count the number of heart rate monitors recorded in the log file.
2. Check how many times each monitor appears in the log file.
3. Determine the first time each monitor was used.
4. Determine the last time each monitor was used.

Each results is appended in the `analysis_report.txt` file.

## analyze_temperature

This function focuses on analyzing temperature data from the log file. Before starting, it checks if the temperature_log.log file exists. If the file isn’t found, the program stops and asks the user to run it again after fixing the issue. This makes sure we don’t move forward without the data we need.

Once the file is confirmed to be there, the function goes through the log and does the following:
1. Counts how many different temperature monitors are recorded in the file.
2. Checks how many times each temperature monitor appears.
3. Finds the first time each temperature monitor was used.
4. Finds the last time each temperature monitor was used.

## analyze_water_usage

<!-- comment here  -->
