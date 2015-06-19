
# to catch Remove-Item errors
$ErrorActionPreference = 'Stop'

# change to this directory, make the test directory, change to it
$PSScriptRoot = Split-Path $MyInvocation.MyCommand.Path
Set-Location -LiteralPath $PSScriptRoot
Remove-Item -LiteralPath [c] -ErrorAction 0 -Force -Recurse
mkdir [c] | Set-Location

# results
$log = New-Object System.Collections.Specialized.OrderedDictionary

# make a file
42 > test.txt
$log.FileCreated = [System.IO.File]::Exists("$PSScriptRoot\[c]\test.txt")

# try to remove by Remove-Item -LiteralPath, it fails
$log.ErrorRemoveLiteral = try { Remove-Item -LiteralPath test.txt } catch {$_}
$log.FileExistsAfterRemoveLiteral = [System.IO.File]::Exists("$PSScriptRoot\[c]\test.txt")

# remove by Remove-Item -Path, it works
Remove-Item -Path test.txt
$log.FileExistsAfterRemovePath= [System.IO.File]::Exists("$PSScriptRoot\[c]\test.txt")

# results
$log

# remove the test directory
Set-Location ..
Remove-Item -LiteralPath [c]
