
# temp file
$temp = Join-Path $env:TEMP test.clixml

# new hashtable, case insensitive
$hash = @{one = 1}

# true, it is case insensitive
$hash.Contains('ONE')

# export/import
$hash | Export-Clixml $temp
$hash = Import-Clixml $temp

# v2: false, it becomes case sensitive
# v3: true, it is still case insensitive, but see v3.case.sensitivity.depends.ps1
$hash.Contains('ONE')

# remove temp clixml
[System.IO.File]::Delete($temp)
