
task Test-1-FileSystem {
	($r = .\Test-1-FileSystem.ps1)
	assert ('\\server\a' -eq $r)
}

task Test-2-Function {
	($r = .\Test-2-Function.ps1)
	assert ('' -eq $r)
}

task Test-3.1-Registry {
	($r = try {.\Test-3.1-Registry.ps1} catch {$_})
	assert ($r.FullyQualifiedErrorId -eq 'Argument,Microsoft.PowerShell.Commands.SplitPathCommand')
}

task Test-3.2-Registry {
	($r = try {.\Test-3.2-Registry.ps1} catch {$_})
	assert ('\\server\a\b\test.txt' -eq $r)
}

task Test-Workaround.ps1 {
	($r = .\Test-Workaround.ps1)
	assert ('\\server\a' -eq $r)
}
