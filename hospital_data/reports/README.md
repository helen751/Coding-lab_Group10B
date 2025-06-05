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

<!-- comment here  -->

## analyze_temperature

<!-- comment here  -->

## analyze_water_usage

<!-- comment here  -->
