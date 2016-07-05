
# Make an object with an empty NoteProperty X by an expression with no value
$x = 1 | Select-Object -Property @{Name = 'X'; Expression = {}}

# Show that the property X exists
$x | Get-Member X

# v5: fails
# v2: works
$x | Group-Object -Property X
