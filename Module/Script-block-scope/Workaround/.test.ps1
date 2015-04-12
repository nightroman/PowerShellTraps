
task Workaround {
	($r = .\Test-Module2.ps1)
	assert ($r -eq 'Local message: New custom message.')
}
