
task error.action.continue {
	($r = .\error.action.continue.ps1)
	assert ('Caught 13|Invoked after error.' -eq $r -join '|')
}

task error.action.stop {
	($r = try {.\error.action.stop.ps1} catch {$_})
	assert ('Caught 13' -eq $r[0])
	assert ($r[1].FullyQualifiedErrorId -eq '13')
}
