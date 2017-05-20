
# skip all tests if the type is missing
try {
	$null = [System.Linq.Expressions.Expression]
}
catch {
	Write-Warning 'Missing [System.Linq.Expressions.Expression]'
	return task skipLinq
}

$Version = $PSVersionTable.PSVersion.Major

task Test-1 {
	($r = try {.\Test-1.ps1} catch {$_})
	if ($Version -ge 5) {
		equals $r.FullyQualifiedErrorId MethodCountCouldNotFindBest
	}
	else {
		assert ($r -is [System.Linq.Expressions.Expression])
	}
}

task Test-2 {
	($r = .\Test-2.ps1)
	assert ($r -is [System.Linq.Expressions.Expression])
}
