
task Test-1-fails {
	($r = try {.\Test-1-fails.ps1} catch {$_})
	equals $r.FullyQualifiedErrorId 'NoProcessFoundForGivenName,Microsoft.PowerShell.Commands.WaitProcessCommand'
}

task Test-2-works {
	.\Test-2-works.ps1
}
