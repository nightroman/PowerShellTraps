if ($PSVersionTable.PSVersion.Major -lt 5) {return task v5}

task Test-1 {
	$r = ./Test-1.ps1
	equals "$r" 'KnownTypeAttribute True KnownTypeAttribute True'
}
