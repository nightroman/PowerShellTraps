
task test.1.eq {
	($r = .\test.1.eq.ps1)
	assert ('This is called|42' -eq $r -join '|')
}

task test.2.gt {
	($r = .\test.2.gt.ps1)
	assert ('42' -eq $r)
	assert (Test-Path 0)
	Remove-Item 0
}
