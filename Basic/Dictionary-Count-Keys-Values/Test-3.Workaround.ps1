# This script uses get_Count(), get_Keys(), get_Values().
# They get expected results, unlike Count, Keys, Values.

$table = @{Count=42; Keys=1; Values=2}

# 3
"Count: $($table.get_Count())"

# Count Keys Values
"Keys: $($table.get_Keys() | Sort-Object)"

# 1 2 42
"Values: $($table.get_Values() | Sort-Object)"
