
task Test-1 {
	($r = .\Test-1.ps1)
	equals $r.FullyQualifiedErrorId 'PathNotFound,Microsoft.PowerShell.Commands.GetChildItemCommand'
}
