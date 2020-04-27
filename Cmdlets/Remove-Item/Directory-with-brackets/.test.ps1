
$Version = $PSVersionTable.PSVersion.Major

#_200427_195327
task Test-1-directory-with-brackets -If ($Version -lt 7) {
	($r = .\Test-1-directory-with-brackets.ps1)
	equals $r.FileCreated $true

	# fixed in v6.2.0-preview.2
	if ($Version -ge 6) {
		equals $r.Count 3
		equals $r.ErrorRemoveLiteral $null
		equals $r.FileExistsAfterRemoveLiteral $false
	}
	else {
		equals $r.ErrorRemoveLiteral.FullyQualifiedErrorId 'PathNotFound,Microsoft.PowerShell.Commands.RemoveItemCommand'
		equals $r.FileExistsAfterRemoveLiteral $true
		equals $r.FileExistsAfterRemovePath $false
	}
}
