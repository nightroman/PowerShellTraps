
$Version = $PSVersionTable.PSVersion.Major

task Test-1.ToString {
	($r = ./Test-1.ToString.ps1)
	equals $r.Count 2
	equals $r[0] PSCustomObject
	equals $r[1] $true
}

task Test-2.notation.ps1 {
	($r = ./Test-2.notation.ps1)
	if ($Version -eq 2) {
		equals $r Hashtable
	}
	else {
		equals $r PSCustomObject
	}
}
