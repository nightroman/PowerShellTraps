
# The current version.
$PSVersion = $PSVersionTable.PSVersion

# This test makes sense in PS v3+, hence the `-if`.
task Unwanted-version -if ($PSVersion.Major -ge 3) {
	($r = PowerShell -Version 2 .\Unwanted-version.ps1)
	assert ($r.Count -eq 2)
	assert ($r[0] -eq $PSVersion)
	assert ($r[1] -eq '2.0')
}

task Version-must-be-first {
	($r = .\Version-must-be-first.ps1 | Out-String)
	assert ($LASTEXITCODE -eq 1)
	assert ($r -like '-Version :*FullyQualifiedErrorId : CommandNotFoundException*')
}
