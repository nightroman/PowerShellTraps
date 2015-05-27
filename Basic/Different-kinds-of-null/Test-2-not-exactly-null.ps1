
Set-StrictMode -Version 2

### Test with nothing null

# the same $it1 from test 1, contains nothing
$it1 = 1..5 | Where-Object {$_ -gt 6}

# try because it fails in v2 in the strict mode
try {
	# False
	$null -eq $it1.PSObject

	# System.Management.Automation.PSCustomObject
	$it1.PSObject.BaseObject.GetType().FullName
}
catch {
	$_.FullyQualifiedErrorId
}

### Test with true null

# true null
$it2 = $null

# try because it fails in v2 in the strict mode
try {
	# True
	$null -eq $it2.PSObject
}
catch {
	$_.FullyQualifiedErrorId
}
