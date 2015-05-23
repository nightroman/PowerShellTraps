
# set location to this script directory
$PSScriptRoot = Split-Path $MyInvocation.MyCommand.Definition
Set-Location -LiteralPath $PSScriptRoot

# make the directory "test[" and the script "test.ps1" in it
if (!(Test-Path -LiteralPath test[)) {
	$null = mkdir test[
	Set-Content -LiteralPath test[\test.ps1 -Value 42
}

# this works and proves that "test[" should not be a problem
& '.\test[\test.ps1'

# this fails due to the invalid wildcard
& "$PSScriptRoot\test[\test.ps1"
