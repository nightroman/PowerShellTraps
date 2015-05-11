
Set-StrictMode -Version 2

function Get-Something {
	'string'
}

$results = Get-Something

# fails
$results.Count
