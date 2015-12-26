
task Test-Problem {
	($r = .\Test-Problem.ps1)
	equals $r "Processed as ''"
}

task Test-Workaround -If ($PSVersionTable.PSVersion.Major -ge 3) {
	($r = .\Test-Workaround.ps1)
	equals $r 'Processed as null'
}
