
# Make an object with an empty NoteProperty X by an expression with no value
$x = 1 | Select-Object -Property @{Name = 'X'; Expression = {$null}}

# Works
$x | Group-Object -Property X
