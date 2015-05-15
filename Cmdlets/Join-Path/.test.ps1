
task Test-missing-drive {
	($r = try {.\Test-missing-drive.ps1} catch {$_})
	assert ($r[0] -like '?:\test\test.txt')
	assert ($r[1].FullyQualifiedErrorId -eq 'DriveNotFound,Microsoft.PowerShell.Commands.JoinPathCommand')
}

task Test-mind-the-provider {
	($r = .\Test-mind-the-provider.ps1)
	assert ($r[0] -eq '\\server\test\test.txt')
	assert ($r[1] -eq 'test.txt')
}
