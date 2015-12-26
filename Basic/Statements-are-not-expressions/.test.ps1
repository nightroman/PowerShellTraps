
task foreach-cannot-be-piped {
	($r = try {.\foreach-cannot-be-piped.ps1} catch {$_})
	equals $r.FullyQualifiedErrorId 'EmptyPipeElement'
}

task foreach-cannot-be-redirected {
	($r = try {.\foreach-cannot-be-redirected.ps1} catch {$_})
	equals '1|2|3|4|5' ($r[0..4] -join '|')
	equals $r[-1].FullyQualifiedErrorId 'CommandNotFoundException'
}
