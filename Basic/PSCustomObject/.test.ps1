
$Version = $PSVersionTable.PSVersion.Major

task Test1.ToString {
	($r = ./Test1.ToString.ps1)
	equals $r.Count 2
	if ($Version -eq 2) {
		equals $r[0] System.Collections.Hashtable
		equals $r[1] $false
	}
	else {
		equals $r[0] ''
		equals $r[1] $true
	}
}
