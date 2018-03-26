
$Version = $PSVersionTable.PSVersion.Major
$v610 = $PSVersionTable.PSVersion -ge ([version]'6.0.9999')

task Test-1.Path {
	$r = .\Test-1.Path.ps1
	($r = @($r | Group-Object Extension -NoElement))
	equals $r.Count 1
}

task Test-2.Path {
	$r = .\Test-2.LiteralPath.ps1
	($r = @($r | Group-Object Extension -NoElement))

	if ($Version -eq 2 -or ($Version -ge 5 -and !$v610)) {
		# unexpected
		assert ($r.Count -ge 2)
	}
	else {
		# expected
		equals $r.Count 1
	}
}
