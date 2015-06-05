
task Test-Command-syntax {
	($r = .\Test-Command-syntax.ps1 | Out-String)
	assert ($r.TrimEnd() -clike '*MissingEndCurlyBrace*Exit code: 1')
}

task Test-Command-throw {
	($r = .\Test-Command-throw.ps1 | Out-String)
	assert ($r.TrimEnd() -clike '*Some error.*Exit code: 1')
}

task Test-File-syntax {
	($r = .\Test-File-syntax.ps1 | Out-String)
	assert ($r.TrimEnd() -clike '*MissingEndCurlyBrace*Exit code: 0')
}

task Test-File-throw {
	($r = .\Test-File-throw.ps1 | Out-String)
	assert ($r.TrimEnd() -clike '*Some error.*Exit code: 0')
}
