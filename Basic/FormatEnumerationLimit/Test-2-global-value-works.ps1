
# ensure the default value for this test
$global:FormatEnumerationLimit = 4

function Test-FormatEnumerationLimit {
	# create a object with property Data1 = 1, 2, .., 10
	$e = 1 | Select-Object Data1
	$e.Data1 = 1..10

	# save the global value
	$oldFormatEnumerationLimit = $global:FormatEnumerationLimit

	# set FormatEnumerationLimit to 8 globally
	$global:FormatEnumerationLimit = 8

	# do some formatting
	$e | Format-List | Out-String

	# restore the global value; ideally, try/finally should be used and the
	# value restored in the finally block, this is not done in this test
	$global:FormatEnumerationLimit = $oldFormatEnumerationLimit
}

Test-FormatEnumerationLimit
