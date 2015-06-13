
$PSScriptRoot = Split-Path $MyInvocation.MyCommand.Definition
$Source = "$PSScriptRoot\1"
$Target = "$PSScriptRoot\2"

# remove test files
Remove-Item $Source, $Target -Force -Recurse -ErrorAction 0

# make test input, a source directory and files in it
$null = mkdir $Source
42 > "$Source\test.log"
42 > "$Source\test.txt"

# copy with -Exclude *.log -Recurse
Copy-Item -Path $Source -Destination $Target -Exclude *.log -Recurse

# as a result, test.log is copied, too
Get-ChildItem $Target -Recurse -Name

# remove test files
Remove-Item $Source, $Target -Force -Recurse
