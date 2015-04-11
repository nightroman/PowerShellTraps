
task v3.case.sensitivity.depends {
	($r = .\v3.case.sensitivity.depends.ps1)
	assert ($r.Count -eq 4)
	assert ($r[0] -ceq 'A')
	assert ($r[1] -ceq 'a')
	assert ($r[2] -eq $false)
	if ($PSVersionTable.PSVersion.Major -ge 3) {
		assert ($r[3] -eq $true)
	}
	else {
		assert ($r[3] -ceq $false)
	}
}

task v2.case.sensitive.always {
	($r = .\v2.case.sensitive.always.ps1)
	assert ($r.Count -eq 2)
	assert ($r[0] -eq $true)
	if ($PSVersionTable.PSVersion.Major -ge 3) {
		assert ($r[1] -eq $true)
	}
	else {
		assert ($r[1] -ceq $false)
	}
}
