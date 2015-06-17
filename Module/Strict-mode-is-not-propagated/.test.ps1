
task Test-1-Script1 {
	($r = try {.\Test-1-Script1.ps1} catch {$_})
	assert $r.FullyQualifiedErrorId.Equals('VariableIsUndefined')
}

task Test-2-Script2 {
	($r = try {.\Test-2-Script2.ps1} catch {$_})
	assert $r.FullyQualifiedErrorId.Equals('VariableIsUndefined')
}

task Test-3-Module1 {
	($r = .\Test-3-Module1.ps1)
	assert $r.Equals('Variable is ')
}
