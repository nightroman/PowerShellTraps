
$v2 = $PSVersionTable.PSVersion.Major -eq 2

task test1.no.results {
	($r = .\test1.no.results.ps1)
	if ($v2) {
		assert ($null -eq $r)
	}
	else {
		assert (0 -eq $r)
	}
}

task test1.no.results.strict {
	($r = try {.\test1.no.results.strict.ps1} catch {$_})
	assert ($r.FullyQualifiedErrorId -eq 'PropertyNotFoundStrict')
}

task test2.one.object.Count {
	($r = .\test2.one.object.Count.ps1)
	if ($v2) {
		assert ($null -eq $r)
	}
	else {
		assert (1 -eq $r)
	}
}

task test2.one.object.Count.strict {
	($r = try {.\test2.one.object.Count.strict.ps1} catch {$_})
	assert ($r.FullyQualifiedErrorId -eq 'PropertyNotFoundStrict')
}

task test3.one.object.Length {
	($r = .\test3.one.object.Length.ps1)
	assert (6 -eq $r)
}

task test4.one.object.Count {
	($r = .\test4.one.object.Count.ps1)
	assert (3 -eq $r)
}
