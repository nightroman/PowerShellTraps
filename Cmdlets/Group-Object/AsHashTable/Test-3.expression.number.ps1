
# It gets a normal hashtable with a number expression
$r = Get-ChildItem | Group-Object -Property {$_.Length} -AsHashTable

# README.md
$length = (Get-Item README.md).Length
$r[$length]
