
task Test-OrderedDictionary {
	($r = .\Test-Array.ps1)
	assert ($r.Count -eq 2)
	assert ($r[0] -eq 'Object[]')
	assert ($r[1] -eq 'ArrayList')
}
