
task Test-1 {
	($r = ./Test-1.ps1)
	equals $r.Count 2
	equals $r[0] 'Test-Path temp.txt = True'
	equals $r[1] 'Test-Path temp.* = False'
}
