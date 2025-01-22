
# This works and creates [DayOfWeek]::Wednesday
[DayOfWeek]'Monday,Tuesday'

# This works and creates [DayOfWeek]::Wednesday
[DayOfWeek]('Monday', 'Tuesday')

# This works and creates [DayOfWeek]::Wednesday
[Enum]::Parse([DayOfWeek], 'Monday,Tuesday')
