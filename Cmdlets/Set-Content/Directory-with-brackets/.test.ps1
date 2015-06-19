
task Test-1-directory-with-brackets {
	($r = .\Test-1-directory-with-brackets.ps1)

	# -Path: error
	assert $r.Test1.FullyQualifiedErrorId.Equals('ItemNotFound,Microsoft.PowerShell.Commands.SetContentCommand')

	# -LiteralPath:
	if ($PSVersionTable.PSVersion.Major -eq 2) {
		assert $r.Test2.Equals($false)
	}
	else {
		assert $r.Test2.Equals($true)
	}
}
