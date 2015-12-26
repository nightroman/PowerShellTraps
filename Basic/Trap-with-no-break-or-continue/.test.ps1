
task error.action.continue {
	($r = .\error.action.continue.ps1)
	equals 'Caught 13|Invoked after error.' ($r -join '|')
}

task error.action.stop {
	($r = try {.\error.action.stop.ps1} catch {$_})
	equals 'Caught 13' $r[0]
	equals $r[1].FullyQualifiedErrorId '13'
}
