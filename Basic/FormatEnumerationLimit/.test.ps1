
task Test-1-local-value-ignored {
	($r = .\Test-1-local-value-ignored.ps1)
	assert ('Data1 : {1, 2, 3, 4...}' -eq $r.Trim())
}

task Test-2-global-value-works {
	($r = .\Test-2-global-value-works.ps1)
	assert ('Data1 : {1, 2, 3, 4, 5, 6, 7, 8...}' -eq $r.Trim())
}
