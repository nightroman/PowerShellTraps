
task looks-like-object-is-null {
	($r = .\looks-like-object-is-null.ps1)
	assert ($r -eq 'This is called.')
}

task object-is-eq-and-ne-to-1 {
	($r = .\object-is-eq-and-ne-to-1.ps1)
	assert ($r[0] -eq 'This is called.')
	assert ($r[1] -eq 'This is also called.')
}

