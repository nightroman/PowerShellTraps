
task Test-1-inconsistent-destination {
	($r = .\Test-1-inconsistent-destination.ps1)
	assert ('test.txt' -eq $r.files1)
	assert ('1|1\test.txt|test.txt' -eq ($r.files2 | Sort-Object) -join '|')
}

task Test-2-workaround {
	($r = .\Test-2-workaround.ps1)
	assert ('test.txt' -eq $r.files1)
	assert ('test.txt' -eq $r.files2)
}
