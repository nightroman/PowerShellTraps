
task ArrayList.Add.1 {
	($r = .\ArrayList.Add.1.ps1)
	assert ('0|1|Hello|World' -eq $r -join '|')
}

task ArrayList.Add.2 {
	($r = .\ArrayList.Add.2.ps1)
	assert ('Hello|World' -eq $r -join '|')
}
