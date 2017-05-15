
$Version = $PSVersionTable.PSVersion.Major
if ($Version -eq 2) {return task skip2}

task Test-1.long.integer {
	($r = ./Test-1.long.integer.ps1)
	if ($Version -ge 6) {
		equals $r System.Int64
	}
	else {
		equals $r System.Int32
	}
}
