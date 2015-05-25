
# ensure the default value for this test
$global:FormatEnumerationLimit = 4

function Test-FormatEnumerationLimit {
	# create a object with property Data1 = 1, 2, .., 10
	$e = 1 | Select-Object Data1
	$e.Data1 = 1..10

	# set FormatEnumerationLimit to 8 (to be ignored)
	$FormatEnumerationLimit = 8

	# do some formatting
	$e | Format-List | Out-String
}

Test-FormatEnumerationLimit
