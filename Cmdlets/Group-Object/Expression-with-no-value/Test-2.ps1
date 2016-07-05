
# Make an object with a NoteProperty X by an expression getting $null
$x = 1 | Select-Object -Property @{Name = 'X'; Expression = {$null}}

# Works
$x | Group-Object -Property X
