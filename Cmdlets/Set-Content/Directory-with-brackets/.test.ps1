
$Version = $PSVersionTable.PSVersion.Major

#_200427_195327
task Test-1-directory-with-brackets -If ($Version -lt 7) {
	($r = .\Test-1-directory-with-brackets.ps1)

	# -Path: error
	equals $r.Test1.FullyQualifiedErrorId 'ItemNotFound,Microsoft.PowerShell.Commands.SetContentCommand'

	# -LiteralPath:
	if ($Version -eq 2) {
		equals $r.Test2 $false
	}
	else {
		equals $r.Test2 $true
	}
}
