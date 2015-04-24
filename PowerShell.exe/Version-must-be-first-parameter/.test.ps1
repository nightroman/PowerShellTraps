
task Version-must-be-first-parameter {
	($r = .\Version-must-be-first-parameter.ps1 | Out-String)
	assert ($LASTEXITCODE -eq 1)
	assert ($r -like '-Version :*FullyQualifiedErrorId : CommandNotFoundException*')
}
