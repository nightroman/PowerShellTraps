
$Version = $PSVersionTable.PSVersion.Major

task Test-1.Environment {
	($r = try {.\Test-1.Environment.ps1} catch {$_})
	equals $r.FullyQualifiedErrorId 'NotSupported,Microsoft.PowerShell.Commands.GetChildItemCommand'
}

task Test-2.1.FileSystem {
	($r = .\Test-2.1.FileSystem.ps1)

	# changed in v7.0.0-preview.1 (gets "unexpected" tmp, as older versions)
	if ($Version -ge 7) {
		assert ($r -contains 'tmp')
	}
	# changed in v6.2.0-preview.2 (no "unexpected" tmp)
	elseif ($Version -ge 6) {
		assert ($r -notcontains 'tmp')
	}
	# older versions gets "unexpected" tmp
	else {
		assert ($r -contains 'tmp')
	}
}

#! skip v6+, try later, unstable results
task -If ($Version -lt 6) Test-2.2.FileSystem {
	($r = .\Test-2.2.FileSystem.ps1)

	#! on some Windows machines may work as "expected"
	try {
		equals ($r -join '|') 'tmp.tmp|tmp.tmp2|False'
	}
	catch {
		Write-Warning $_
	}
}
