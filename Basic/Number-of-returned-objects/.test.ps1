
$v2 = $PSVersionTable.PSVersion.Major -eq 2

task test1.no.results {
	($r = .\test1.no.results.ps1)
	if ($v2) {
		equals $null $r
	}
	else {
		equals 0 $r
	}
}

task test1.no.results.strict {
	($r = try {.\test1.no.results.strict.ps1} catch {$_})
	equals $r.FullyQualifiedErrorId 'PropertyNotFoundStrict'
}

task test2.one.object.Count {
	($r = .\test2.one.object.Count.ps1)
	if ($v2) {
		equals $null $r
	}
	else {
		equals 1 $r
	}
}

task test2.one.object.Count.strict {
	($r = try {.\test2.one.object.Count.strict.ps1} catch {$_})
	equals $r.FullyQualifiedErrorId 'PropertyNotFoundStrict'
}

task test3.one.object.Length {
	($r = .\test3.one.object.Length.ps1)
	equals 6 $r
}

task test4.one.object.Count {
	($r = .\test4.one.object.Count.ps1)
	equals 3 $r
}
