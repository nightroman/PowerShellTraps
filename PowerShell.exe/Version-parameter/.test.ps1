
$Version = $PSVersionTable.PSVersion.Major

task Version-must-be-first-parameter -If ($Version -le 5) {
	($r = .\Version-must-be-first-parameter.ps1 | Out-String)
	equals $global:LASTEXITCODE 1
	assert ($r -like '-Version :*FullyQualifiedErrorId : CommandNotFoundException*')
}

# fixed in v6-beta.9
task v6-ignores-stuff-after-Version -If ($Version -ge 6) {
	($r = .\v6-ignores-stuff-after-Version.ps1 | Out-String)
	equals $global:LASTEXITCODE 0
	assert ($r -like 'powershell v*')
}
