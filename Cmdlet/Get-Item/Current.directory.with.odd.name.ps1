
# results to be shown and tested
$results = New-Object System.Collections.Specialized.OrderedDictionary

# this script directory
$PSScriptRoot = Split-Path $MyInvocation.MyCommand.Definition

# to catch Get-Item errors
$ErrorActionPreference = 'Stop'

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
# fails
$results.GetItemNormal1 = try {Get-Item test} catch {$_}
# $fails
$results.GetItemLiteral1 = try {Get-Item -LiteralPath test} catch {$_}

### test 2, cd [1] and test [1]\test

$odd = Join-Path $PSScriptRoot '[1]'
New-TestDirectory $odd
Set-Location -LiteralPath $odd

# the current path
$results.Location2 = (Get-Location).Path
# the item 'test' is there
$results.GetChildItem2 = Get-ChildItem
# works now
$results.GetItemNormal2 = Get-Item test
# still fails
$results.GetItemLiteral2 = try {Get-Item -LiteralPath test} catch {$_}

# output
$results
