
task Test-1.1 {
	($r = .\Test-1.1.ps1)

	if ($PSVersionTable.PSVersion.Major -eq 2) {
		assert (2 -eq $r)
	}
	else {
		assert (1 -eq $r)
	}
}

task Test-1.2 {
	($r = .\Test-1.2.ps1)
	assert (2 -eq $r)
}

task Test-2 {
	($r = .\Test-2.ps1)
	assert (2 -eq $r)
}
