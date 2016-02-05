
if ($PSVersionTable.PSVersion.Major -lt 5) {return task test5}

task Test-1.fails {
	($r = try {.\Test-1.fails.ps1} catch {$_})
	equals $r.Count 2
	equals $r[0].GetType().FullName '<94a2c1db>.A'
	equals $r[1].FullyQualifiedErrorId TypeNotFound
}

task Test-2.works {
	($r = .\Test-2.works.ps1)
	equals $r.Count 2
	equals $r[0].GetType().FullName '<94a2c1db>.A'
	equals $r[1].GetType().FullName '<f28d5f1c>.A'
}
