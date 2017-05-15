
$Version = $PSVersionTable.PSVersion.Major

task Test-1 {
	($r = .\Test-1.ps1)
	if ($Version -ge 6) {
		equals $r 'True True True True'
	}
	else {
		equals $r 'False True True True'
	}
}
