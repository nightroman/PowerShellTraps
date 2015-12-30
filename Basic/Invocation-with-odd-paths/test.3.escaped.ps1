
$ErrorActionPreference = 'Stop'

# set location to this script directory
$PSScriptRoot = Split-Path $MyInvocation.MyCommand.Definition
Set-Location -LiteralPath $PSScriptRoot

# make the directory "test[" and the script "test.ps1" in it
if (!(Test-Path -LiteralPath test[)) {
	$null = mkdir test[
	Set-Content -LiteralPath test[\test.ps1 -Value 42
}

# This works in any PowerShell
& "$PSScriptRoot\test``[\test.ps1"

# This works in v5 and fails v2, v3, v4.
# It is not clear though why it needs two backticks in v5.
try {
	& '.\test``[\test.ps1'
}
catch {
	$_
}

# This works in v5 and fails v2, v3, v4.
# Note that the expandable string requires 4 backticks in v5.
try {
	& ".\test````[\test.ps1"
}
catch {
	$_
}
