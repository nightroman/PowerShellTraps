
# change to this directory, remove the test directory, if any
Set-Location -LiteralPath (Split-Path $MyInvocation.MyCommand.Path)
Remove-Item -LiteralPath y[12] -ErrorAction 0 -Force -Recurse

# make the test directory with brackets and an item in it
$null = mkdir y[12]\testdir

# results
$log = New-Object System.Collections.Specialized.OrderedDictionary

# gets "testdir", as expected
$log.NoRecurse = Get-ChildItem -LiteralPath y[12]

# v5+, v2: gets "testdir", as expected
# v3, v4: gets nothing
$log.Recurse = Get-ChildItem -LiteralPath y[12] -Recurse

# results
$log

# remove the test directory
Remove-Item -LiteralPath y[12] -Force -Recurse
