
task Version-must-be-first-parameter {
	($r = .\Version-must-be-first-parameter.ps1 | Out-String)
	equals $LASTEXITCODE 1
	assert ($r -like '-Version :*FullyQualifiedErrorId : CommandNotFoundException*')
}
