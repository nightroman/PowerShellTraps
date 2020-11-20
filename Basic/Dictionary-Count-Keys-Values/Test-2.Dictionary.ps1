# This script uses Count, Keys, Values of a dictionary.
# They are not properties here, this may be unexpected.

$dictionary = New-Object 'System.Collections.Generic.Dictionary[string, object]'
$dictionary.Add('Count', 42)
$dictionary.Add('Keys', 1)
$dictionary.Add('Values', 2)

# 42 instead of expected 3
"Count: $($dictionary.Count)"

# 1 instead of expected ('Count', 'Keys', 'Values')
"Keys: $($dictionary.Keys)"

# 2 instead of expected (42, 1, 2)
"Values: $($dictionary.Values)"
