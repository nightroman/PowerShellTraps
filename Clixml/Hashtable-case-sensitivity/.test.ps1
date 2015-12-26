
task v3.case.sensitivity.depends {
	($r = .\v3.case.sensitivity.depends.ps1)
	equals $r.Count 4
	equals $r[0] 'a'
	equals $r[1] 'A'
	equals $r[2] $false
	if ($PSVersionTable.PSVersion.Major -ge 3) {
		equals $r[3] $true
	}
	else {
		equals $r[3] $false
	}
}

task v2.case.sensitive.always {
	($r = .\v2.case.sensitive.always.ps1)
	equals $r.Count 2
	equals $r[0] $true
	if ($PSVersionTable.PSVersion.Major -ge 3) {
		equals $r[1] $true
	}
	else {
		equals $r[1] $false
	}
}
