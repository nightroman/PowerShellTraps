
# temp file
$temp = Join-Path $env:TEMP test.clixml

# new Object[]
$t1 = @{
	Array = @(11, 22, 33)
}

# it is Object[]
$t1.Array.GetType().Name

# export
$t1 | Export-Clixml $temp

# import
$t2 = Import-Clixml $temp

# it is ArrayList, not Object[]
$t2.Array.GetType().Name

# remove temp clixml
[System.IO.File]::Delete($temp)
