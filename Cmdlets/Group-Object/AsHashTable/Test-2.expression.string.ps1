
# It gets a strange hashtable with a string expression
$r = Get-ChildItem | Group-Object -Property {$_.Extension} -AsHashTable

# 2 (.md, .ps1)
$r.Count

# $null. Expected: README.md
$r['.md']
