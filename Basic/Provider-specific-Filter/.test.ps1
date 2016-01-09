
task Test-1.Environment {
	($r = try {.\Test-1.Environment.ps1} catch {$_})
	equals $r.FullyQualifiedErrorId 'NotSupported,Microsoft.PowerShell.Commands.GetChildItemCommand'
}

task Test-2.1.FileSystem {
	($r = .\Test-2.1.FileSystem.ps1)
	assert ($r -contains 'tmp')
}

task Test-2.2.FileSystem {
	($r = .\Test-2.2.FileSystem.ps1)
	equals ($r -join '|') 'tmp.tmp|tmp.tmp2|False'
}
