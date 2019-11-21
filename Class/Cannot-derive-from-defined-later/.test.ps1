if ($PSVersionTable.PSVersion.Major -lt 5) {return task v5}

task Test-1 {
	$r = try { ./Test-1.ps1 } catch { $_ }
	equals $r.FullyQualifiedErrorId TypeNotFound
}

task Test-2 {
	$r = ./Test-2.ps1
	equals $r DerivedFromDefinedLater
}
