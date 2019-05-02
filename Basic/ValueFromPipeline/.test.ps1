
task Test-1 {
	($r = ./Test-1.ps1)
	equals 6 $r.Count
	equals $r[0] 'P1=v'
	equals $r[1] 'P2=v'
	equals $r[2] 'P1=v1'
	equals $r[3] 'P2=v2'
	equals $r[4] 'P1=v1'
	equals $r[5] 'P2=v2'
}
