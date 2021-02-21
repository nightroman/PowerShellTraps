if ($env:GITHUB_ACTION) {return task GITHUB_ACTION}
$Version = $PSVersionTable.PSVersion.Major

task Test-SyntaxError {
	($r = .\Test-SyntaxError.ps1 | Out-String)
	# 7.0.0-preview.5
	if ($Version -ge 7) {
		equals $r.TrimEnd() 'Exit code: 1'
	}
	elseif ($Version -ge 5) {
		assert ($r.TrimEnd() -clike '*TerminatorExpectedAtEndOfString*Exit code: 1*')
	}
	else {
		assert ($r.TrimEnd() -clike '*FullyQualifiedErrorId : TerminatorExpectedAtEndOfString*Exit code: 0')
	}
}
