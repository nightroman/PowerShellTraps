
task Test-1.1 {
	($r = .\Test-1.1.ps1)

	if ($PSVersionTable.PSVersion.Major -eq 2) {
		equals 2 $r
	}
	else {
		equals 1 $r
	}
}

task Test-1.2 {
	($r = .\Test-1.2.ps1)
	equals 2 $r
}

task Test-2 {
	($r = .\Test-2.ps1)
	equals 2 $r
}
