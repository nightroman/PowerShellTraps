
$v2 = $PSVersionTable.PSVersion.Major -eq 2
$v610 = $PSVersionTable.PSVersion -gt ([version]'6.0.9999')

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

task test5.PSCustomObject {
	($r = ./test5.PSCustomObject.ps1)
	equals $r.Count 3
	if ($v610) {
		equals $r[0] 1
		equals $r[1] $false
		equals $r[2] PSCustomObject
	}
	elseif ($v2) {
		equals $r[0] 2
		equals $r[1] $false
		equals $r[2] Hashtable
	}
	else {
		equals $r[0] $null
		equals $r[1] $true
		equals $r[2] PSCustomObject
	}
}
