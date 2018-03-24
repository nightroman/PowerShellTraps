
task Test-1 {
	($r = ./Test-1.ps1)
	equals $r.Count 2
	assert ($r[0] -like 'Resolve-Path temp.txt = *temp.txt')
	equals $r[1] 'Resolve-Path temp.* = '
}
