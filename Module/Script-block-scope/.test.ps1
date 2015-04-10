
task Test-Module1 {
	($r = .\Test-Module1.ps1)
	assert ($r[0] -eq 'Local message: Default local message.')
	assert ($r[1] -eq 'Local message: New local message.')
	assert ($r[2] -eq 'Local message: New local message.')
	assert ($r[3] -eq 'Global message: Default global message.')
}

task Test-Script1 {
	($r = .\Test-Script1.ps1)
	assert ($r[0] -eq 'Local message: Default local message.')
	assert ($r[1] -eq 'Local message: New local message.')
	assert ($r[2] -eq 'Local message: New custom message.')
	assert ($r[3] -eq 'Global message: Default global message.')
}
