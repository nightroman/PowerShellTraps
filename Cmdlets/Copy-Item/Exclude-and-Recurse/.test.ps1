
task Test-Copy-Item-Exclude {
	($r = .\Test-Copy-Item-Exclude.ps1)
	equals 'test.log|test.txt' ($r -join '|')
}
