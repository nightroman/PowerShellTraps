
# the validation script is called for each value in a collection
function Test-Parameter {
	param(
		[ValidateScript({$null = $log.Add("Validated $_"); $true})]
		$Value
	)
}

$log = [System.Collections.ArrayList]@()
Test-Parameter @(1, 2, 3)
$log
