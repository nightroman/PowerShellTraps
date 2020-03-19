
task Test-1 {
	$r = ./Test-1.ps1
	equals $r.Id ([uint32]0)
	equals $r.Name ($Host.ToString())
}

task Test-2 {
	$r = ./Test-2.ps1
	equals $r.Id ([uint32]0)
	equals $r.Name '42'
}
