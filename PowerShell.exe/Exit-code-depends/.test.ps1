
task Test-Script.with.command {
	($r = .\Test-Script.with.command.ps1)
	assert ($r.code1 -eq 1)
	assert ($r.code2 -eq 0)
	assert ($r.code3 -eq 0)
}
