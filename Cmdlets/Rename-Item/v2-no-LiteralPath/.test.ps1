
$Version = $PSVersionTable.PSVersion.Major

task Test-1.Rename-Item.LiteralPath {
	($r = try {.\Test-1.Rename-Item.LiteralPath.ps1} catch {$_})
	if ($Version -eq 2) {
		equals $r.FullyQualifiedErrorId 'NamedParameterNotFound,Microsoft.PowerShell.Commands.RenameItemCommand'
	}
	else {
		equals $r $null
	}
}

task Test-2.Move-Item.LiteralPath {
	$r = .\Test-2.Move-Item.LiteralPath.ps1
	equals $r $null
}
