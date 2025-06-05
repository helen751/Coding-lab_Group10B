# Task 1: Interactive Archival Script (archive_logs.sh)

## Hospital Data Monitoring & Archival System

This project was to develop an automated log management system that:

1. Collects real-time patient health metrics and resource usage data
2. Provides controlled log archiving with user selection
3. Generates analytical reports with device statistics and temporal patterns
4. Demonstrates proficiency in: interactive shell scripting, log file processing and data analysis with Linux tools.

## Project Structure

Logs files for users' inputs

```bash
    heart_rate.log
    temperature.log
    water_usage.log
```

Archive folders for storing old logs

```bash
    heart_data_archive/
    temperature_data_archive/
    water_data_archive/
```

- `archive_logs.sh` For archiving logs file into their corresponding folders
- `analyze_logs.sh`For analyzing or managing logs
- `README.md` for explaining the scripting process

## Scripting process

After setting-up the python simulators and directories structure, we divided the required tasks based on:

- Interactive Archival script `./archive_logs.sh`
- Intelligent Analysis script `./analyze_logs.sh`

1. The first task is to clone the repo into your local machine using: `git clone https://github.com/helen751/Coding-lab_Group10B.git`
2. `cd into Coding-lab_Group10B`
3. `git pull origin archived_logs`
4. Then `git status` to check whether you are in the origin branch

## Feature implementation

Implement a feature so that when the script is run, you are prompted by a numbered menu of log types to choose a running log file to archive:

- We created the file using `vi archive_logs.sh`
- Then wrote a script inside that can prompted by a number
- Quit the vi editor using esc. Press caps lock and press "z" twice to return back.
- We used `chmod +x archive_logs.sh` to make the file executable.
- Run the script using `./archive_logs.sh`

When the script runs the user will be prompted by this message:

```bash
Select log to archive:

1. Heart Rate
2. Temperature
3. Water Usage
```

- When you just enter 1, 2, or 3, and the script will:
- Move the selected log to the archive folder
- Rename it using the current date and time
- Create a fresh log file with the same name for new data stream

If a user enters an invalid input (i.e: anything other than 1, 2 or 3), they will be shown this message.
`Invalid choice. Please enter a number between 1 and 3.` and they will have to re-run the application again.

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

<!-- comment here  -->

## analyze_water_usage

<!-- comment here  -->
