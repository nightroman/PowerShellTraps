
if ($PSVersionTable.PSVersion.Major -lt 5) {return task test5}

task Test-1.can.use {
	($r = .\Test-1.can.use.ps1)
	equals $r A
}

task Test-2.cannot.derive {
	($r = try {.\Test-2.cannot.derive.ps1} catch {$_})
	equals $r.FullyQualifiedErrorId TypeNotFound
}
