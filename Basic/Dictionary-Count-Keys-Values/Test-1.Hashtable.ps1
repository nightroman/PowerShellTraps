# This script uses Count, Keys, Values of a hashtable.
# They are not properties here, this may be unexpected.

$table = @{Count=42; Keys=1; Values=2}

# 42 instead of expected 3
"Count: $($table.Count)"

# 1 instead of expected ('Count', 'Keys', 'Values')
"Keys: $($table.Keys)"

# 2 instead of expected (42, 1, 2)
"Values: $($table.Values)"
