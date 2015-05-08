
$Version = $PSVersionTable.PSVersion

task break.missing {
	($r = PowerShell -Version $Version -NoProfile .\break.missing.ps1)
	assert ($LASTEXITCODE -eq 0)
	assert ('1 1|1 2' -eq $r -join '|')
}

task continue.missing {
	($r = PowerShell -Version $Version -NoProfile .\continue.missing.ps1)
	assert ($LASTEXITCODE -eq 0)
	assert ('1 1|1 2' -eq $r -join '|')
}
