
task Test-missing-drive {
	($r = try {.\Test-missing-drive.ps1} catch {$_})
	assert ($r[0] -like '?:\test\test.txt')
	equals $r[1].FullyQualifiedErrorId 'DriveNotFound,Microsoft.PowerShell.Commands.JoinPathCommand'
}

task Test-mind-the-provider {
	($r = .\Test-mind-the-provider.ps1)
	equals $r[0] '\\server\test\test.txt'
	equals $r[1] 'test.txt'
}
