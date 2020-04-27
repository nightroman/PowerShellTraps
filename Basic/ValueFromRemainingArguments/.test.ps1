$Version = $PSVersionTable.PSVersion.Major
$ErrorView = 'NormalView'

task Test-1 {
	$err = ''
	try {
		($r = .\Test-1.ps1)
	}
	catch {
		$err = $_
	}

	if ($Version -ge 7) {
		equals $err.FullyQualifiedErrorId 'CommandArgsOnlyForSingleCmdlet,Microsoft.PowerShell.Commands.GetCommandCommand'
	}
	else {
		equals $r.Count 2
		equals $r[0].Name bar
		equals $r[1].Name Get-Variable
	}
}
