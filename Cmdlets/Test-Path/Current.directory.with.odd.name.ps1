
# results to be shown and tested
$results = New-Object System.Collections.Specialized.OrderedDictionary

# this script directory
$PSScriptRoot = Split-Path $MyInvocation.MyCommand.Definition

# makes a directory and a directory 'test' in it
function New-TestDirectory($Path) {
	$test = "$Path/test"
	if (![System.IO.Directory]::Exists($test)) {$null = mkdir $test}
}

### test 1, cd `[1] and test `[1]\test

$odd = Join-Path $PSScriptRoot '`[1]'
New-TestDirectory $odd
Set-Location -LiteralPath $odd

# the current path
$results.Location1 = (Get-Location).Path
# the item 'test' is there
$results.GetChildItem1 = Get-ChildItem
# $false, expected $true
$results.TestPathNormal1 = Test-Path test
# $false, expected $true
$results.TestPathLiteral1 = Test-Path -LiteralPath test

### test 2, cd [1] and test [1]\test

$odd = Join-Path $PSScriptRoot '[1]'
New-TestDirectory $odd
Set-Location -LiteralPath $odd

# the current path
$results.Location2 = (Get-Location).Path
# the item 'test' is there
$results.GetChildItem2 = Get-ChildItem
# $true, correct
$results.TestPathNormal2 = Test-Path test
# $false, expected $true
$results.TestPathLiteral2 = Test-Path -LiteralPath test

# output
$results
