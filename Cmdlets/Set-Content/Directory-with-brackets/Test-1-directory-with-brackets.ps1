
# to catch Set-Content errors
$ErrorActionPreference = 'Stop'

# change to this directory, make the test directory, change to it
$PSScriptRoot = Split-Path $MyInvocation.MyCommand.Path
Set-Location -LiteralPath $PSScriptRoot
Remove-Item -LiteralPath [c] -ErrorAction 0 -Force -Recurse
mkdir [c] | Set-Location

# results
$log = New-Object System.Collections.Specialized.OrderedDictionary

### test 1: -Path

$log.Test1 = try {
	# fails
	Set-Content -Path test.txt -Value 42
}
catch {
	$_
}

### test 2: -LiteralPath

# works in v3+, fails silently in v2
Set-Content -LiteralPath test.txt -Value 42
$log.Test2 = [System.IO.File]::Exists("$PSScriptRoot\[c]\test.txt")

# results
$log

# remove the test directory
Set-Location ..
Remove-Item -LiteralPath [c] -Force -Recurse
