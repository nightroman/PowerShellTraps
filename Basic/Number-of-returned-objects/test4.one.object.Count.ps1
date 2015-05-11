
function Get-Something {
	@{x=1; y=2; z=3}
}

$results = Get-Something

# v2: 3
# v3: 3
$results.Count
