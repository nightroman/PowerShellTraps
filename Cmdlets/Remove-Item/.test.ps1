
task Test-1-directory-with-brackets {
	($r = .\Test-1-directory-with-brackets.ps1)
	assert $r.FileCreated.Equals($true)
	assert $r.ErrorRemoveLiteral.FullyQualifiedErrorId.Equals('PathNotFound,Microsoft.PowerShell.Commands.RemoveItemCommand')
	assert $r.FileExistsAfterRemoveLiteral.Equals($true)
	assert $r.FileExistsAfterRemovePath.Equals($false)
}
