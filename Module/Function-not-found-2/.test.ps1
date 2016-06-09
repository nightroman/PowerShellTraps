
task Test-Script2 {
	($r = .\Test-Script2.ps1)
	equals $r MyFunction
}

task Test-Module2 {
	($r = try {.\Test-Module2.ps1} catch {$_})
	equals $r.FullyQualifiedErrorId CommandNotFoundException
}
