if ($env:GITHUB_ACTION) {return task GITHUB_ACTION}
if ($PSVersionTable.PSVersion.Major -le 4) {return task skip4}
$ErrorView = 'NormalView' #! v7

task Test-1.missing.item {
	($r = try {.\Test-1.missing.item.ps1} catch {$_})
	equals $r.Count 2
	equals $r[0] 'invoked'
	equals $r[1].FullyQualifiedErrorId 'PathNotFound,Microsoft.PowerShell.Commands.GetItemPropertyValueCommand'
}

task Test-2.existing.item {
	($r = exec {Invoke-PowerShell -NoProfile -Command '$ErrorView = ''NormalView''; .\Test-2.existing.item.ps1'} | Out-String)
	assert ($r -clike '*FullyQualifiedErrorId*FullyQualifiedErrorId*invoked #1*FullyQualifiedErrorId*invoked #2*')
}

task Test-3.unexpected.stop.try {
	($r = .\Test-3.unexpected.stop.try.ps1)
	equals $r.FullyQualifiedErrorId 'Argument,Microsoft.PowerShell.Commands.GetItemPropertyValueCommand'
}

task Test-4.unexpected.stop.trap {
	($r = .\Test-4.unexpected.stop.trap)
	equals $r.FullyQualifiedErrorId 'Argument,Microsoft.PowerShell.Commands.GetItemPropertyValueCommand'
}
