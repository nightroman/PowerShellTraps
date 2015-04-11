
# temp file
$temp = Join-Path $env:TEMP test.clixml

# new OrderedDictionary
if ($PSVersionTable.PSVersion.Major -ge 3) {
	$t1 = [ordered] @{
		p1 = 11
		p2 = 22
		p3 = 33
	}
}
else {
	$t1 = New-Object System.Collections.Specialized.OrderedDictionary
	$t1.Add('p1', 11)
	$t1.Add('p2', 22)
	$t1.Add('p3', 33)
}

# it is OrderedDictionary
$t1.GetType().Name

# export
$t1 | Export-Clixml $temp

# import
$t2 = Import-Clixml $temp

# it is Hashtable, not OrderedDictionary
$t2.GetType().Name

# remove temp clixml
[System.IO.File]::Delete($temp)
