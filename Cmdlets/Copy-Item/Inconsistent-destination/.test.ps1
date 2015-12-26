
task Test-1-inconsistent-destination {
	($r = .\Test-1-inconsistent-destination.ps1)
	equals 'test.txt' $r.files1
	equals '1|1\test.txt|test.txt' (($r.files2 | Sort-Object) -join '|')
}

task Test-2-workaround {
	($r = .\Test-2-workaround.ps1)
	equals 'test.txt' $r.files1
	equals 'test.txt' $r.files2
}
