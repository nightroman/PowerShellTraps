
task Test-1.unsafe {
	($r = .\Test-1.unsafe.ps1)
	equals $r.Count 2
	equals $r[0] invoked
	equals $r[1] invoked
}

task Test-2.safe {
	($r = try {.\Test-2.safe.ps1} catch {$_})
	equals $r.FullyQualifiedErrorId 'Modules_ModuleNotFound,Microsoft.PowerShell.Commands.ImportModuleCommand'
}
