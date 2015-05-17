
function Test-Parameter {
	param(
		[ValidateScript({$true})]
		$Value
	)
}

Test-Parameter $null
