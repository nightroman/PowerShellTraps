
# the validation script just gets $true for all values
function Test-Parameter {
	param(
		[ValidateScript({$true})]
		$Value
	)
}

# fails because null is not allowed with ValidateScript
Test-Parameter $null
