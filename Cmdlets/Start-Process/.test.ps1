
task Test-1-directory-with-brackets {
	($r = .\Test-1-directory-with-brackets.ps1)
	assert $r.FullyQualifiedErrorId.Equals('FileOpenFailure,Microsoft.PowerShell.Commands.StartProcessCommand')
}

task Test-2-ErrorAction-ignored {
	($r = .\Test-2-ErrorAction-ignored.ps1)
	assert $r.FullyQualifiedErrorId.Equals('InvalidOperationException,Microsoft.PowerShell.Commands.StartProcessCommand')
}
