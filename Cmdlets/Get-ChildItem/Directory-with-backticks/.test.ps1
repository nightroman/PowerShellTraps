
$v610 = $PSVersionTable.PSVersion -ge ([version]'6.0.9999')

task Test-1 {
	($r = .\Test-1.ps1)
	if ($v610) {
		equals $r.Count 2
		equals $r[0] 'v6.1.0 worked'
		equals $r[1].FullyQualifiedErrorId 'ItemNotFound,Microsoft.PowerShell.Commands.GetChildItemCommand'
	}
	else {
		equals $r.FullyQualifiedErrorId 'PathNotFound,Microsoft.PowerShell.Commands.GetChildItemCommand'
	}
}
