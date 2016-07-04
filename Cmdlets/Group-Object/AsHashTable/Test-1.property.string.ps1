
# It works as expected with a property name
$r = Get-ChildItem | Group-Object -Property Extension -AsHashTable

# 2 (.md, .ps1)
$r.Count

# README.md
$r['.md']
