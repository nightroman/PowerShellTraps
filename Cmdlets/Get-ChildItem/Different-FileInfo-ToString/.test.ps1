
task Test-1-different-ToString {
	($r = .\Test-1-different-ToString.ps1)

	# full path
	assert ($r.strings1[0] -like '*\Different-FileInfo-ToString\.test.ps1')

	# just name
	equals $r.strings2[0] '.test.ps1'
}

task Test-2-Resolve-Path-fails {
	($r = try {.\Test-2-Resolve-Path-fails.ps1} catch {$_})
	assert ($r.Count -ge 2)
	equals $r[0].GetType().Name 'PathInfo'
	equals $r[-1].FullyQualifiedErrorId 'PathNotFound,Microsoft.PowerShell.Commands.ResolvePathCommand'
}
