
$Version = $PSVersionTable.PSVersion.Major

task Test-SyntaxError {
	($r = .\Test-SyntaxError.ps1 | Out-String)
	if ($Version -ge 5) {
		assert ($r.TrimEnd() -clike '*FullyQualifiedErrorId : TerminatorExpectedAtEndOfString*Exit code: 1')
	}
	else {
		assert ($r.TrimEnd() -clike '*FullyQualifiedErrorId : TerminatorExpectedAtEndOfString*Exit code: 0')
	}
}
