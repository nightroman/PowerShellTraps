
# the simple validation script results in cryptic error messages.
function Test-Parameter {
	param(
		[ValidateScript({$_ -match '^\w+$'})]
		$Name
	)
	"Name is $Name"
}

# fails with a cryptic message
Test-Parameter invalid-name
