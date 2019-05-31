
$ErrorActionPreference = 'Stop'

# set location to this script directory
$PSScriptRoot = Split-Path $MyInvocation.MyCommand.Definition
Set-Location -LiteralPath $PSScriptRoot

# make the directory "test[" and the script "test.ps1" in it
$null = mkdir test[ -Force
Set-Content -LiteralPath test[\test.ps1 -Value 42

# Test 1. This works in v2-v6 and fails in v7
try {
	& "$PSScriptRoot\test``[\test.ps1"
}
catch {
	$_
}

# Test 2. This works in v5+ and fails v2, v3, v4.
# It is not clear though why it needs two backticks in v5.
try {
	& '.\test``[\test.ps1'
}
catch {
	$_
}

# Test 3. This works in v5+ and fails v2, v3, v4.
# The expandable string requires 4 backticks in v5.
try {
	& ".\test````[\test.ps1"
}
catch {
	$_
}

# Test 4. For some reason 5 backticks also work in v5+.
try {
	& ".\test`````[\test.ps1"
}
catch {
	$_
}

Remove-Item -LiteralPath test[ -Force -Recurse
