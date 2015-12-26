
task Test-1-command-and-script {
	($r = .\Test-1-command-and-script.ps1)
	equals 1 $r.code1
	equals 0 $r.code2
	equals 0 $r.code3
	equals 0 $r.code4
}
