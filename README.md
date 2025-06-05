##Hospital Data Monitoring & Archival System
This project was to develop an automated log management system that:

collects real-time patient health metrics and resource usage data

Provides controlled log archiving with user selection

Generates analytical reports with device statistics and temporal patterns

Demonstrates proficiency in:

Interactive shell scripting
Log file processing
Data analysis with Linux tools

##Proejct Structure

#logs files for users' inputs
heart_rate.log
temperature.log
water_usage.log

#Archive folders for storing old logs
heart_data_archive/
temperature_data_archive/
water_data_archive/

#archive_logs.sh #For archiving logs file into their corresponding folders

# analyze_logs.sh # For analyzing or managing logs
#README.md for explaining the scripting process

#Scripting process
After setting-up the python simulators and directories structure: We divided the required tasks based on:
#Interactive Archival Script (archive_logs.sh)
#Intelligent Analysis Script (analyze_logs.sh)

#However, as a collaborator working on Interactive Archival Script.
#The first task is to clone the repo into local machine: for example

git clone https://github.com/helen751/Coding-lab_Group10B.git
Then,
cd into Coding-lab_Group10B

#git pull origin archived_logs

Then git status: to check whether you are in the origin branch

#Next Step: Implement a feature so that when the script is run, you are prompted by a numbered menu of log types to choose a running log file to archive:

#File created: Using vi archive_logs.sh
Then write a script inside that can prompted by a numbered.

#quit: Using esc, press caps lock and press "z" twice to return back
chmod +x archive_logs.sh
#Run the script by: ./archive_logs.sh

#When the script runs, you will be asked:
Select log to archive:
1) Heart Rate
2) Temperature
3) Water Usage

#When you just enter 1, 2, or 3, and the script will:

Move the selected log to the archive folder

Rename it using the current date and time

Create a fresh log file with the same name for new data

#Finally appeared to be successfully run script
