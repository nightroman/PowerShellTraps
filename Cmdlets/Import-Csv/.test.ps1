
task Import-Csv.trims.leading.spaces {
	($r = .\Import-Csv.trims.leading.spaces.ps1)

	# leading spaces are trimmed
	assert ($r[0] -eq "Data1 'with spaces 1  '")
	assert ($r[1] -eq "Data1 'with spaces 2  '")
}
