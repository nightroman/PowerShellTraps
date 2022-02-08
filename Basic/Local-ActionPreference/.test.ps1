if ($env:GITHUB_ACTION) {return task GITHUB_ACTION}

task Test-1-2-script-scope {
	($r = .\Test-1-2-script-scope.ps1)
	equals 'Invalid|Invalid|Invalid|Invalid|Invalid' ($r -join '|')
}

task Test-1-3-global-scope {
	# v2 gets 10 output lines, v3 gets 5. So get the output as one string and
	# test it with patterns (?m)^...
	($r = .\Test-1-3-global-scope.ps1 | Out-String)
	assert ($r -match '(?m)^ErrorActionPreference:')
	assert ($r -match '(?m)^WarningPreference:')
	assert ($r -match '(?m)^DebugPreference:')
	assert ($r -match '(?m)^VerbosePreference:')
	assert ($r -match '(?m)^ProgressPreference:')
}

function Invoke-Script($Path) {
	(Invoke-PowerShell -NoProfile -File $Path | Out-String).TrimEnd()
}

task Test-2-1-invalid-error-effect {
	($r = Invoke-Script Test-2-1-invalid-error-effect.ps1)
	assert ($r -clike 'Test-Preference : Message*Done.')
}

task Test-2-2-invalid-warning-effect {
	($r = Invoke-Script Test-2-2-invalid-warning-effect.ps1)
	assert ($r -clike '*WARNING: Message*Done.*')
}

task Test-2-3-invalid-debug-effect {
	($r = Invoke-Script Test-2-3-invalid-debug-effect.ps1)
	equals $r 'Done.'
}

task Test-2-4-invalid-verbose-effect {
	($r = Invoke-Script Test-2-4-invalid-verbose-effect.ps1)
	equals $r 'Done.'
}
