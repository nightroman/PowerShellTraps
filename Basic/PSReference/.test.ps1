
$Version = $PSVersionTable.PSVersion.Major

task Test-1.lost.ref.object {
	($r = ./Test-1.lost.ref.object.ps1)
	if ($Version -ge 5) {
		equals $r[0] 'PSReference`1'
		equals $r[1] String
	}
	elseif ($Version -eq 2) {
		equals $r[0] PSReference
		equals $r[1] String
	}
	else {
		Write-Warning not-tested-version
	}
}

task Test-2.lost.ref.array {
	($r = ./Test-2.lost.ref.array.ps1)
	if ($Version -ge 5) {
		equals $r[0] 'PSReference`1'
		equals $r[1] 'PSReference`1'
		equals $r[2] String
	}
	elseif ($Version -eq 2) {
		equals $r[0] PSReference
		equals $r[1] PSReference
		equals $r[2] String
	}
	else {
		Write-Warning not-tested-version
	}
}
