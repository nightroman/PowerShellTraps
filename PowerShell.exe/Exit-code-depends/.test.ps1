
task Test-1-command-and-script {
	($r = .\Test-1-command-and-script.ps1)
	assert (1 -eq $r.code1)
	assert (0 -eq $r.code2)
	assert (0 -eq $r.code3)
	assert (0 -eq $r.code4)
}
