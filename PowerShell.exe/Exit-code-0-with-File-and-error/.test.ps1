
task Test-AsCommand {
	($r = .\Test-AsCommand.ps1 | Out-String)
	assert ($r.TrimEnd() -clike '*Some error.*Exit code: 1')
}

task Test-AsFile {
	($r = .\Test-AsFile.ps1 | Out-String)
	assert ($r.TrimEnd() -clike '*Some error.*Exit code: 0')
}
