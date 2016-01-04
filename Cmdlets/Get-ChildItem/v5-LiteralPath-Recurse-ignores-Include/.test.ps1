
$Version = $PSVersionTable.PSVersion.Major

task Test-1.Path {
	$r = .\Test-1.Path.ps1
	($r = @($r | Group-Object Extension -NoElement))
	equals $r.Count 1
}

task Test-2.Path {
	$r = .\Test-2.LiteralPath.ps1
	($r = @($r | Group-Object Extension -NoElement))

	if ($Version -eq 5 -or $Version -eq 2) {
		# unexpected
		assert ($r.Count -ge 2)
	}
	else {
		# expected
		equals $r.Count 1
	}
}
