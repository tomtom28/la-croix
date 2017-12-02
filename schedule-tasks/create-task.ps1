# Run this once to make the drink-water.ps1 script a scheduled task
# Script runs for a day (24 hr duration), triggered every hour (60 minutes)

# Determine current path
$CURRENT_PATH = $pwd.Path
$RUN_THIS_FILE = $CURRENT_PATH + "\drink-water.ps1"

# Schedule Task to call script
schtasks /Create /SC DAILY /TN "La Croix - Drink Water Reminder" /TR "powershell $RUN_THIS_FILE" /RI 60 /DU 24:00

#powershell $pwd.Path + "\drink-water.ps1"