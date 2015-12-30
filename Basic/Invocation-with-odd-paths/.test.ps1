
$Version = $PSVersionTable.PSVersion.Major

function Exit-Build {
	Remove-Item -LiteralPath test[ -Force -Recurse -ErrorAction 0
}

task test.1.invocation {
	($r = .\test.1.invocation.ps1)

	equals $r.Count 2
	if ($Version -eq 5) {
		assert ('NotSpecified: (:) [], WildcardPatternException' -eq $r[0].CategoryInfo)
		assert ('NotSpecified: (:) [], WildcardPatternException' -eq $r[1].CategoryInfo)
	}
	else {
		equals 42 $r[0]
		assert ('NotSpecified: (:) [], WildcardPatternException' -eq $r[1].CategoryInfo)
	}
}

task test.2.dot-sourcing {
	($r = try {.\test.2.dot-sourcing.ps1} catch {$_})

	equals $r.Count 2
	if ($Version -eq 5) {
		assert ('NotSpecified: (:) [], WildcardPatternException' -eq $r[0].CategoryInfo)
		assert ('NotSpecified: (:) [], WildcardPatternException' -eq $r[1].CategoryInfo)
	}
	else {
		equals 42 $r[0]
		assert ('NotSpecified: (:) [], WildcardPatternException' -eq $r[1].CategoryInfo)
	}
}

task test.3.escaped {
	($r = .\test.3.escaped.ps1)

	equals $r.Count 3
	equals $r[0] 42
	if ($Version -eq 5) {
		equals $r[1] 42
		equals $r[2] 42
	}
	else {
		equals $r[1].FullyQualifiedErrorId CommandNotFoundException
		equals $r[2].FullyQualifiedErrorId CommandNotFoundException
	}
}
