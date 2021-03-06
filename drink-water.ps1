# Global Variables are set that are goals to drink water & workday hours
# Script will create a GUI that informs the user the time and how much water should have been consumed


# Daily Goal of Water (fl oz)
$WATER_GOAL = 72

# Water Goal in terms of La Croix Cans (1 can = 12 fl oz)
$LA_CROIX = 12

# Time frame in which to drink
$WORK_DAY_START = 10 # 10:00 or 10am
$WORK_DAY_END = 18 # 18:00 or 6pm
$WORK_DAY_LENGTH = $WORK_DAY_END - $WORK_DAY_START


# Rate at which water is to be consumed (fl oz / hr)
$HOURS_IN_WORKDAY = $WORK_DAY_END - $WORK_DAY_START
$DRINK_RATE = $WATER_GOAL / $HOURS_IN_WORKDAY

# Get Current Hour (ex. 8am is 8 and 8pm is 20)
$currentHour = [int] (Get-Date).ToString('HH')



# Exit script if work day is over
if ( $currentHour -gt $WORK_DAY_END ) {
    echo "Workday is over! Yay!"
    exit
}

# Exit script if work day is not started
if ( $currentHour -lt $WORK_DAY_START ) {
    echo "Workday has not started."
    exit
}


# Get Target Qtys (target = rate * hr passed)
$targetFlOz = $DRINK_RATE * ($currentHour - $WORK_DAY_START)
$targetLaCroix = $targetFlOz / $LA_CROIX


# Generate Alert Text
$alertMessage = "It is now: " + (Get-Date).ToString('hh:mm tt') + "`r`r" +
    "Target Fl Oz: " + $targetFlOz + "`r`r" +
    "Target La Croix: " + $targetLaCroix
    

# Create A Pop Up Dialog (Lasts 5 seconds if not acknowledged)
$wshell = New-Object -ComObject Wscript.Shell
$wshell.Popup($alertMessage, 5, "Water Reminder!", 1)