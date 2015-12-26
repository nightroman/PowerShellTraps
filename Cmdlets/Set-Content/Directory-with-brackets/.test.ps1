
task Test-1-directory-with-brackets {
	($r = .\Test-1-directory-with-brackets.ps1)

	# -Path: error
	equals $r.Test1.FullyQualifiedErrorId 'ItemNotFound,Microsoft.PowerShell.Commands.SetContentCommand'

	# -LiteralPath:
	if ($PSVersionTable.PSVersion.Major -eq 2) {
		equals $r.Test2 $false
	}
	else {
		equals $r.Test2 $true
	}
}
