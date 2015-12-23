
task Test-1 {
	($r = .\Test-1.ps1)
	assert $r.FullyQualifiedErrorId.Equals('PathNotFound,Microsoft.PowerShell.Commands.GetChildItemCommand')
}
