
Set-StrictMode -Version 2

function Get-Something {
}

$results = Get-Something

# fails
$results.Count
