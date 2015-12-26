
task Test-1-directory-with-brackets {
	($r = .\Test-1-directory-with-brackets.ps1)
	equals $r.FullyQualifiedErrorId 'FileOpenFailure,Microsoft.PowerShell.Commands.StartProcessCommand'
}

task Test-2-ErrorAction-ignored {
	($r = .\Test-2-ErrorAction-ignored.ps1)
	equals $r.FullyQualifiedErrorId 'InvalidOperationException,Microsoft.PowerShell.Commands.StartProcessCommand'
}
