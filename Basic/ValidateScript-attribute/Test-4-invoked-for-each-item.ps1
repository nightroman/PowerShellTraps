
$log = [System.Collections.ArrayList]@()

function Test-Parameter {
	param(
		[ValidateScript({$null = $log.Add("Validated $_"); $true})]
		$Value
	)
}

Test-Parameter @(1, 2, 3)
$log
