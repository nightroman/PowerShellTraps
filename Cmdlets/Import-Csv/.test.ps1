
task Import-Csv.trims.leading.spaces {
	($r = .\Import-Csv.trims.leading.spaces.ps1)

	# leading spaces are trimmed
	equals $r[0] "Data1 'with spaces 1  '"
	equals $r[1] "Data1 'with spaces 2  '"
}
