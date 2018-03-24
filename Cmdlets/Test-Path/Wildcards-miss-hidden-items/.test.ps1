
task Test-1 {
	($r = ./Test-1.ps1)
	equals $r.Count 3
	equals $r[0] 'Test-Path z\hidden = True'
	equals $r[1] 'Test-Path *\hidden = False'
	equals $r[2] 'Test-Path z\* = False'
	remove z
}
