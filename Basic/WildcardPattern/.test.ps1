
task Test-1-Escape-UnEscape-wildcard {
	($r = .\Test-1-Escape-UnEscape-wildcard.ps1)
	equals $r.OriginalText '``text``'
	equals $r.EscapedText '``text``'
	equals $r.MatchesOriginal $false
	equals $r.UnEscapedText '`text`'
	equals $r.EqualToOriginal $false
}

task Test-2-Escape-UnEscape-regex {
	($r = .\Test-2-Escape-UnEscape-regex.ps1)
	equals $r.OriginalText '\\text\\'
	equals $r.EscapedText '\\\\text\\\\'
	equals $r.MatchesOriginal $true
	equals $r.UnEscapedText '\\text\\'
	equals $r.EqualToOriginal $true
}

task Test-3-Escape-workaround {
	($r = .\Test-3-Escape-workaround.ps1)
	equals $r.OriginalText '``_`[_`]_`?_`*_[_]_?_*_`'
	equals $r.EscapedText '````_```[_```]_```?_```*_`[_`]_`?_`*_``'
	equals $r.MatchesOriginal $true
	equals $r.UnEscapedText '``_`[_`]_`?_`*_[_]_?_*_`'
	equals $r.EqualToOriginal $true
}
