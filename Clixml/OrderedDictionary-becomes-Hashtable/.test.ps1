
task Test-OrderedDictionary {
	($r = .\Test-OrderedDictionary.ps1)
	assert ($r.Count -eq 2)
	assert ($r[0] -eq 'OrderedDictionary')
	assert ($r[1] -eq 'Hashtable')
}
