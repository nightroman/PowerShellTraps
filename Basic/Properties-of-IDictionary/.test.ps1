
task Test-1.incorrect.assignment {
	($r = .\Test-1.incorrect.assignment.ps1)
	equals $r 'ConnectionString'
}

task Test-2.correct.assignment {
	($r = .\Test-2.correct.assignment.ps1)
	equals $r[0] 'server'
	equals $r[1] 'user'
}
