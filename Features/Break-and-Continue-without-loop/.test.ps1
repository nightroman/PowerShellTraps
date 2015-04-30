
$Version = $PSVersionTable.PSVersion

task Test-Break {
	($r = PowerShell -Version $Version -NoProfile .\Test-Break.ps1)
	assert ($r -eq 'begin')
}

task Test-Continue {
	($r = PowerShell -Version $Version -NoProfile .\Test-Continue.ps1)
	assert ($r -eq 'begin')
}

task Test-Break2 {
	($r = .\Test-Break2.ps1)
	assert ($r.Count -eq 2)
	assert ($r[0] -eq 'begin 1')
	assert ($r[1] -eq 'end')
}

task Test-Continue2 {
	($r = .\Test-Continue2.ps1)
	assert ($r.Count -eq 3)
	assert ($r[0] -eq 'begin 1')
	assert ($r[1] -eq 'begin 2')
	assert ($r[2] -eq 'end')
}
