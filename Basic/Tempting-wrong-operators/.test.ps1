
task test.1.eq {
	($r = .\test.1.eq.ps1)
	equals 'This is called|42' ($r -join '|')
}

task test.2.gt {
	($r = .\test.2.gt.ps1)
	equals '42' $r
	assert (Test-Path 0)
	Remove-Item 0
}
