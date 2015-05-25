
task Test-1-fails {
	($r = try {.\Test-1-fails.ps1} catch {$_})
	assert ('NoProcessFoundForGivenName,Microsoft.PowerShell.Commands.WaitProcessCommand' -eq $r.FullyQualifiedErrorId)
}

task Test-2-works {
	.\Test-2-works.ps1
}
