
function Get-Something {
	'string'
}

$results = Get-Something

# v2: null
# v3: 1
$results.Count
