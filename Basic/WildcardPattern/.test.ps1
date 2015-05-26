
task Test-1-Escape-UnEscape-wildcard {
	($r = .\Test-1-Escape-UnEscape-wildcard.ps1)
	assert ($r.OriginalText -eq '``text``')
	assert ($r.EscapedText -eq '``text``')
	assert ($r.MatchesOriginal -eq $false)
	assert ($r.UnEscapedText -eq '`text`')
	assert ($r.EqualToOriginal -eq $false)
}

task Test-2-Escape-UnEscape-regex {
	($r = .\Test-2-Escape-UnEscape-regex.ps1)
	assert ($r.OriginalText -eq '\\text\\')
	assert ($r.EscapedText -eq '\\\\text\\\\')
	assert ($r.MatchesOriginal -eq $true)
	assert ($r.UnEscapedText -eq '\\text\\')
	assert ($r.EqualToOriginal -eq $true)
}

task Test-3-Escape-workaround {
	($r = .\Test-3-Escape-workaround.ps1)
	assert ($r.OriginalText -eq '``_`[_`]_`?_`*_[_]_?_*_`')
	assert ($r.EscapedText -eq '````_```[_```]_```?_```*_`[_`]_`?_`*_``')
	assert ($r.MatchesOriginal -eq $true)
	assert ($r.UnEscapedText -eq '``_`[_`]_`?_`*_[_]_?_*_`')
	assert ($r.EqualToOriginal -eq $true)
}
