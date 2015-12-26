
task ArrayList.Add.1 {
	($r = .\ArrayList.Add.1.ps1)
	equals '0|1|Hello|World' ($r -join '|')
}

task ArrayList.Add.2 {
	($r = .\ArrayList.Add.2.ps1)
	equals 'Hello|World' ($r -join '|')
}
