
# temp file
$temp = Join-Path $env:TEMP test.clixml

### TEST 1: case sensitive stays case sensitive

# new case sensitive hashtable with keys 'a' and 'A'
$hash = New-Object System.Collections.Hashtable
$hash.Add('a', 1)
$hash.Add('A', 2)

# export/import
$hash | Export-Clixml $temp
$hash = Import-Clixml $temp

# the dehydrated is still case sensitive, it contains keys 'A' and 'a'
$hash.Keys | Sort-Object -CaseSensitive

### TEST 2: case sensitive becomes case insensitive

# new case sensitive hashtable with a key 'a'
$hash = New-Object System.Collections.Hashtable
$hash.Add('a', 1)

# false, it is case sensitive
$hash.Contains('A')

# export/import
$hash | Export-Clixml $temp
$hash = Import-Clixml $temp

# v2: false, it is still case sensitive
# v3: true, it becomes case insensitive
$hash.Contains('A')

# remove temp clixml
[System.IO.File]::Delete($temp)
