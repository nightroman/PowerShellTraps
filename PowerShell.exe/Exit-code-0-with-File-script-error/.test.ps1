if ($env:GITHUB_ACTION) {return task GITHUB_ACTION}
$Version = $PSVersionTable.PSVersion.Major

task Test-Command-syntax {
	($r = .\Test-Command-syntax.ps1 | Out-String)
	if ($Version -ge 7) {
		assert ($r.TrimEnd() -clike '*ParserError:*Exit code: 1*')
	}
	else {
		assert ($r.TrimEnd() -clike '*MissingEndCurlyBrace*Exit code: 1')
	}
}

task Test-Command-throw {
	($r = .\Test-Command-throw.ps1 | Out-String)
	assert ($r.TrimEnd() -clike '*Some error.*Exit code: 1')
}

# fixed in v5
task Test-File-syntax {
	($r = .\Test-File-syntax.ps1 | Out-String)
	if ($Version -ge 7) {
		assert ($r.TrimEnd() -clike '*ParserError:*Exit code: 1*')
	}
	elseif ($Version -ge 5) {
		assert ($r.TrimEnd() -clike '*MissingEndCurlyBrace*Exit code: 1')
	}
	else {
		assert ($r.TrimEnd() -clike '*MissingEndCurlyBrace*Exit code: 0')
	}
}

# fixed in v5
task Test-File-throw {
	($r = .\Test-File-throw.ps1 | Out-String)
	if ($Version -ge 5) {
		assert ($r.TrimEnd() -clike '*Some error.*Exit code: 1')
	}
	else {
		assert ($r.TrimEnd() -clike '*Some error.*Exit code: 0')
	}
}
