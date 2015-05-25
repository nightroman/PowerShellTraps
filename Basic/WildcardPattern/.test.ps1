
task Test-1-Escape-UnEscape-wildcard {
	($r = .\Test-1-Escape-UnEscape-wildcard.ps1)
	assert ($r.OriginalText -eq '``text``')
	assert ($r.EscapedText -eq '``text``')
	assert ($r.UnEscapedText -eq '`text`')
	assert ($r.MatchesTheOriginal -eq $false)
}

task Test-2-Escape-UnEscape-regex {
	($r = .\Test-2-Escape-UnEscape-regex.ps1)
	assert ($r.OriginalText -eq '\\text\\')
	assert ($r.EscapedText -eq '\\\\text\\\\')
	assert ($r.UnEscapedText -eq '\\text\\')
	assert ($r.MatchesTheOriginal -eq $true)
}
