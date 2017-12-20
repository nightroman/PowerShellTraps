
task Test-1.expression {
	($r = ./Test-1.expression.ps1)
	equals $r.Count 4
	equals $r[0] '""'
	equals $r[1] '`"'
	equals $r[2] '.. " ..'
	equals $r[3] '.. " ..'
}
