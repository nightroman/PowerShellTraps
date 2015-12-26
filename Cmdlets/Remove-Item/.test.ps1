
task Test-1-directory-with-brackets {
	($r = .\Test-1-directory-with-brackets.ps1)
	equals $r.FileCreated $true
	equals $r.ErrorRemoveLiteral.FullyQualifiedErrorId 'PathNotFound,Microsoft.PowerShell.Commands.RemoveItemCommand'
	equals $r.FileExistsAfterRemoveLiteral $true
	equals $r.FileExistsAfterRemovePath $false
}
