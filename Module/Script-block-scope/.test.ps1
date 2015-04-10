
# Synopsis: Expected results.
task Test-Script1 {
	($r = .\Test-Script1.ps1)
	assert ($r[0] -eq 'Local message: Default local message.')
	assert ($r[1] -eq 'Local message: New local message.')
	assert ($r[2] -eq 'Local message: New custom message.')
	assert ($r[3] -eq 'Global message: Default global message.')
}

# Synopsis: $r[2] is different.
task Test-Module1-as-command {
	($r = PowerShell -Version $PSVersionTable.PSVersion -NoProfile -Command .\Test-Module1.ps1)
	assert ($r[0] -eq 'Local message: Default local message.')
	assert ($r[1] -eq 'Local message: New local message.')
	assert ($r[2] -eq 'Local message: New local message.')
	assert ($r[3] -eq 'Global message: Default global message.')
}

# Synopsis: $r[2] and $r[3] are different.
task Test-Module1-as-file {
	($r = PowerShell -Version $PSVersionTable.PSVersion -NoProfile -File .\Test-Module1.ps1)
	assert ($r[0] -eq 'Local message: Default local message.')
	assert ($r[1] -eq 'Local message: New local message.')
	assert ($r[2] -eq 'Local message: New local message.')
	assert ($r[3] -eq 'Global message: New custom message.')
}
