
$Version = $PSVersionTable.PSVersion
${5.0} = [version]'5.0.0'
${3.0} = [version]'3.0.0'

task Test-1.exclude.file {
	if ($Version -ge ${5.0}) {
		($r = .\Test-1.exclude.file.ps1)
		equals $r.Name z1
	}
	elseif ($Version -lt ${3.0}) {
		($r = .\Test-1.exclude.file.ps1)
		equals $r.FullyQualifiedErrorId 'PathNotFound,Microsoft.PowerShell.Commands.GetChildItemCommand'
	}
	else {
		Write-Warning 'Not tested PS version'
	}
}

task Test-2.exclude.directory {
	($r = .\Test-2.exclude.directory.ps1)
	equals $r $false
}
