
task Test-Break {
	($r = Invoke-PowerShell -NoProfile .\Test-Break.ps1)
	equals $r 'begin'
}

task Test-Continue {
	($r = Invoke-PowerShell -NoProfile .\Test-Continue.ps1)
	equals $r 'begin'
}

task Test-Break2 {
	($r = .\Test-Break2.ps1)
	equals $r.Count 2
	equals $r[0] 'begin 1'
	equals $r[1] 'end'
}

task Test-Continue2 {
	($r = .\Test-Continue2.ps1)
	equals $r.Count 3
	equals $r[0] 'begin 1'
	equals $r[1] 'begin 2'
	equals $r[2] 'end'
}
