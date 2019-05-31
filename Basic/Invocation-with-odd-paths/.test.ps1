
$Version = $PSVersionTable.PSVersion.Major

task test.1.invocation {
	($r = .\test.1.invocation.ps1)

	equals $r.Count 2
	if ($Version -ge 7) {
		equals $r[0] 42
		equals $r[1] 42
	}
	elseif ($Version -ge 5) {
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
	if ($Version -ge 7) {
		equals $r[0] 42
		equals $r[1] 42
	}
	elseif ($Version -ge 5) {
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

	equals $r.Count 4
	if ($Version -ge 7) {
		equals $r[0].FullyQualifiedErrorId CommandNotFoundException
		equals $r[1] 42
		equals $r[2] 42
		equals $r[3] 42
	}
	elseif ($Version -ge 5) {
		equals $r[0] 42
		equals $r[1] 42
		equals $r[2] 42
		equals $r[3] 42
	}
	else {
		equals $r[0] 42
		equals $r[1].FullyQualifiedErrorId CommandNotFoundException
		equals $r[2].FullyQualifiedErrorId CommandNotFoundException
		equals $r[3].FullyQualifiedErrorId CommandNotFoundException
	}
}
