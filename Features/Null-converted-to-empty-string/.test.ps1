
task Test-Problem {
	($r = .\Test-Problem.ps1)
	assert ($r -eq "Processed as ''")
}

task Test-Workaround -If ($PSVersionTable.PSVersion.Major -ge 3) {
	($r = .\Test-Workaround.ps1)
	assert ($r -eq "Processed as null")
}
