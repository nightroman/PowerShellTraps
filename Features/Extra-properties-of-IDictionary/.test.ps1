
task Test-1.incorrect.assignment {
	($r = .\Test-1.incorrect.assignment.ps1)
	assert ($r -eq 'ConnectionString')
}

task Test-2.correct.assignment {
	($r = .\Test-2.correct.assignment.ps1)
	assert ($r[0] -eq 'server')
	assert ($r[1] -eq 'user')
}
