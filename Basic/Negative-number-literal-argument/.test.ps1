
task Test-1 {
	($r = ./Test-1.ps1)
	equals 'Int32|String|Int32' ($r -join '|')
}

task Test-2 {
	($r = ./Test-2.ps1)
	equals 2 $r.Count
	equals (-1) $r[0]
	equals '-21' $r[1]
}
