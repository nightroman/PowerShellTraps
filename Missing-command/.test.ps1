
$Version = $PSVersionTable.PSVersion

task missing.command.1 {
	($r = PowerShell -Version $Version -NoProfile .\missing.command.1.ps1 | Out-String)
	assert ($LASTEXITCODE -eq 0)
	assert ($r -like '*FullyQualifiedErrorId : CommandNotFoundException*Continued after missing-command*')
}

task missing.command.2 {
	($r = PowerShell -Version $Version -NoProfile .\missing.command.2.ps1)
	assert ($LASTEXITCODE -eq 0)
	assert ($r -eq 'Caught')
}

task missing.command.3 {
	($r = PowerShell -Version $Version -NoProfile .\missing.command.3.ps1)
	assert ($LASTEXITCODE -eq 0)
	assert ($r -eq 'Caught')
}
