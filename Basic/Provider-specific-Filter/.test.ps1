
$Version = $PSVersionTable.PSVersion.Major

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

	# fixed? in Windows 10? | v6?
	if ([Environment]::OSVersion.Version.Major -ge 10 -or $Version -ge 6) {
		equals ($r -join '|') 'tmp.tmp|True'
	}
	else {
		equals ($r -join '|') 'tmp.tmp|tmp.tmp2|False'
	}
}
