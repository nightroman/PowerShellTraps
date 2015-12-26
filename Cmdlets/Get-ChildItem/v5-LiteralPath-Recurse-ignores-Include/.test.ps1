
task Test-1.Path {
	$r = .\Test-1.Path.ps1
	($r = @($r | Group-Object Extension -NoElement))
	equals $r.Count 1
}

task Test-2.Path {
	$r = .\Test-2.LiteralPath.ps1
	($r = @($r | Group-Object Extension -NoElement))

	# get installed version, not current, because in v5 -Version 2 has same issues
	$PSVersionInstalled = PowerShell.exe -NoProfile '$PSVersionTable.PSVersion.Major'

	if ($PSVersionInstalled -eq 5) {
		assert ($r.Count -ge 2)
	}
	else {
		equals $r.Count 1
	}
}
