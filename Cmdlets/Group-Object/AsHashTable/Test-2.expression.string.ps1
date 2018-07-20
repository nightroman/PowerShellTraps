
# It gets a strange hashtable with a string expression
$r = Get-ChildItem | Group-Object -Property {$_.Extension} -AsHashTable

# 2 (.md, .ps1)
$r.Count

# v6.1.0-preview.4 : README.md (expected)
# older versions : $null (actual)
$r['.md']
