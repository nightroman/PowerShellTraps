
task object-looks-like-0-and-true {
	($r = .\object-looks-like-0-and-true.ps1)
	assert ($r[0] -eq 'An object is equal to 0.')
	assert ($r[1] -eq 'But it is evaluated to true.')
}
