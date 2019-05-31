
$Version = $PSVersionTable.PSVersion.Major

task Test-1.Environment {
	($r = try {.\Test-1.Environment.ps1} catch {$_})
	equals $r.FullyQualifiedErrorId 'NotSupported,Microsoft.PowerShell.Commands.GetChildItemCommand'
}

task Test-2.1.FileSystem {
	($r = .\Test-2.1.FileSystem.ps1)

	# changed in v7.0.0-preview.1
	if ($Version -ge 7) {
		assert ($r -contains 'tmp')
	}
	# changed in v6.2.0-preview.2
	elseif ($Version -ge 6) {
		assert ($r -notcontains 'tmp')
	}
	else {
		assert ($r -contains 'tmp')
	}
}

# TODO skip v6+, try later
# win10, v6: OK (but OSVersion check gets 6!)
# win81, v6: still KO
task -If ($Version -lt 6) Test-2.2.FileSystem {
	($r = .\Test-2.2.FileSystem.ps1)

	# fixed in Windows 10?
	if ([Environment]::OSVersion.Version.Major -ge 10) {
		equals ($r -join '|') 'tmp.tmp|True'
	}
	else {
		equals ($r -join '|') 'tmp.tmp|tmp.tmp2|False'
	}
}
