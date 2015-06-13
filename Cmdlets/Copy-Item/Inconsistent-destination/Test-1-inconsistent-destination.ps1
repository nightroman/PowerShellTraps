
$PSScriptRoot = Split-Path $MyInvocation.MyCommand.Definition
$Source = "$PSScriptRoot\1"
$Target = "$PSScriptRoot\2"

# remove test files, create result collector
Remove-Item $Source, $Target -Force -Recurse -ErrorAction 0
$log = New-Object System.Collections.Specialized.OrderedDictionary

# make test input, a source directory and a file in it
$null = mkdir $Source
42 > "$Source\test.txt"

# test 1, the target directory does not exist, expected results
Copy-Item -Path $Source -Destination $Target -Recurse
$log.files1 = Get-ChildItem $Target -Recurse -Name

# test 2, the target directory exists, unexpected results
Copy-Item -Path $Source -Destination $Target -Recurse
$log.files2 = Get-ChildItem $Target -Recurse -Name

# remove test files, output results
Remove-Item $Source, $Target -Force -Recurse
$log
