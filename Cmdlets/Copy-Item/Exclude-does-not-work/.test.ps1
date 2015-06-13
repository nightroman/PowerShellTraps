
task Test-Copy-Item-Exclude {
	($r = .\Test-Copy-Item-Exclude.ps1)
	assert ('test.log|test.txt' -eq $r -join '|')
}
