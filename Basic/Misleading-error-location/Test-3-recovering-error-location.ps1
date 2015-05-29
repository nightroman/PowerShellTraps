
<#
	This test shows how to recover the correct error location in some cases.
	After failures with confusing error information examine errors in $Error.
	The error $Error[0] may show the correct location.
#>

try {
	# invoke the test which gets a confusing error location
	.\Test-2-misleading-error-location.ps1
}
catch {
	# the caught error is misleading, it points to WillThrow
	$_
}

# the last recorded" error is clear, it points to MissingCommand
$Error[0]
