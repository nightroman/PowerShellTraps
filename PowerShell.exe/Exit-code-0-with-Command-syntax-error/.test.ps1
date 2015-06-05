
task Test-SyntaxError {
	($r = .\Test-SyntaxError.ps1 | Out-String)
	assert ($r.TrimEnd() -clike '*FullyQualifiedErrorId : TerminatorExpectedAtEndOfString*Exit code: 0')
}
