
# change to this directory, remove the test directory, if any
$PSScriptRoot = Split-Path $MyInvocation.MyCommand.Path
Set-Location -LiteralPath $PSScriptRoot
Remove-Item -LiteralPath y[12] -ErrorAction 0 -Force -Recurse

# make the test directory, change to it, make a test file
mkdir y[12] | Set-Location
42 > test.txt

try {
	Start-Process test.txt
}
catch {
	$_
}

# remove the test directory
Set-Location ..
Remove-Item -LiteralPath y[12] -Force -Recurse
