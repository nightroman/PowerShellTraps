
task foreach-cannot-be-piped {
	($r = try {.\foreach-cannot-be-piped.ps1} catch {$_})
	assert ($r.FullyQualifiedErrorId -eq 'EmptyPipeElement')
}

task foreach-cannot-be-redirected {
	($r = try {.\foreach-cannot-be-redirected.ps1} catch {$_})
	assert ('1|2|3|4|5' -eq $r[0..4] -join '|')
	assert ($r[-1].FullyQualifiedErrorId -eq 'CommandNotFoundException')
}
