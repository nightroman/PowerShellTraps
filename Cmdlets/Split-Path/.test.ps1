
task Test-1-FileSystem {
	($r = .\Test-1-FileSystem.ps1)
	equals '\\server\a' $r
}

task Test-2-Function {
	($r = .\Test-2-Function.ps1)
	equals '' $r
}

task Test-3.1-Registry {
	($r = try {.\Test-3.1-Registry.ps1} catch {$_})
	equals $r.FullyQualifiedErrorId 'Argument,Microsoft.PowerShell.Commands.SplitPathCommand'
}

task Test-3.2-Registry {
	($r = try {.\Test-3.2-Registry.ps1} catch {$_})
	equals '\\server\a\b\test.txt' $r
}

task Test-Workaround.ps1 {
	($r = .\Test-Workaround.ps1)
	equals '\\server\a' $r
}
