
function Exit-Build {
	Remove-Item -LiteralPath test[ -Force -Recurse -ErrorAction 0
}

task test.1.invocation {
	($r = try {.\test.1.invocation.ps1} catch {$_})
	assert (42 -eq $r[0])
	assert ('NotSpecified: (:) [], WildcardPatternException' -eq $r[1].CategoryInfo)
}

task test.2.dot-sourcing {
	($r = try {.\test.2.dot-sourcing.ps1} catch {$_})
	assert (42 -eq $r[0])
	assert ('NotSpecified: (:) [], WildcardPatternException' -eq $r[1].CategoryInfo)
}
