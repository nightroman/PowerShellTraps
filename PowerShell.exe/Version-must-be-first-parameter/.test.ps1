
task Version-must-be-first-parameter {
	($r = .\Version-must-be-first-parameter.ps1 | Out-String)
	# fixed in v6-beta.7
	if ($PSVersionTable.PSVersion.Major -ge 6) {
		equals $global:LASTEXITCODE 0
		assert ($r -like 'powershell v*')
	}
	else {
		equals $global:LASTEXITCODE 1
		assert ($r -like '-Version :*FullyQualifiedErrorId : CommandNotFoundException*')
	}
}
