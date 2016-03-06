
$Version = $PSVersionTable.PSVersion.Major

task Test1 {
	($r = try {.\Test1.ps1} catch {$_})
	if ($Version -eq 2) {
		equals $r.FullyQualifiedErrorId 'Modules_InvalidManifestMember,Microsoft.PowerShell.Commands.ImportModuleCommand'
	}
	else {
		equals $r Something
	}
}

task Test2 {
	($r = .\Test2.ps1)
	equals $r Something
}

task Test3 {
	($r = try {.\Test3.ps1} catch {$_})
	if ($Version -eq 2) {
		equals $r.FullyQualifiedErrorId 'Modules_InvalidManifestMember,Microsoft.PowerShell.Commands.ImportModuleCommand'
	}
	else {
		equals $r Something
	}
}

task Test4 {
	($r = try {.\Test4.ps1} catch {$_})
	if ($Version -eq 2) {
		equals $r.FullyQualifiedErrorId 'Modules_InsufficientPowerShellVersion,Microsoft.PowerShell.Commands.ImportModuleCommand'
	}
	else {
		equals $r Something
	}
}
