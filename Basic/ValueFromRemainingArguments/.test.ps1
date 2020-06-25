$Version = $PSVersionTable.PSVersion.Major

task Test-1 {
	if ($Version -ge 7) {
		try {
			.\Test-1.ps1
			throw
		}
		catch {
			($err = $_)
		}
		equals $err.FullyQualifiedErrorId 'CommandArgsOnlyForSingleCmdlet,Microsoft.PowerShell.Commands.GetCommandCommand'
	}
	else {
		($r = .\Test-1.ps1)
		equals $r.Count 2
		equals $r[0].Name bar
		equals $r[1].Name Get-Variable
	}
}
