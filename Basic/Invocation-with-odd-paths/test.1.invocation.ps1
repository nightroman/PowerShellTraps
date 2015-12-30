
$ErrorActionPreference = 'Stop'

# set location to this script directory
$PSScriptRoot = Split-Path $MyInvocation.MyCommand.Definition
Set-Location -LiteralPath $PSScriptRoot

# make the directory "test[" and the script "test.ps1" in it
if (!(Test-Path -LiteralPath test[)) {
	$null = mkdir test[
	Set-Content -LiteralPath test[\test.ps1 -Value 42
}

# this works in v2, v3, v4 and fails in v5
try {
	& '.\test[\test.ps1'
}
catch {
	$_
}

# this fails due to the invalid wildcard
try {
	& "$PSScriptRoot\test[\test.ps1"
}
catch {
	$_
}
