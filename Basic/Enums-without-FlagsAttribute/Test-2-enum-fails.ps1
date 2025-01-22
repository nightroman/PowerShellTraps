
# Output errors and continue
trap {"$_"; continue}

# This fails
[DayOfWeek]'Monday,Saturday'

# This fails
[DayOfWeek]('Monday', 'Saturday')

# This works and creates 7
[Enum]::Parse([DayOfWeek], 'Monday,Saturday')
