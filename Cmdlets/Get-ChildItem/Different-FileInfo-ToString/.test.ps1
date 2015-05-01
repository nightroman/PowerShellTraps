
task different.FileInfo.ToString {
	($r = .\different.FileInfo.ToString.ps1)

	# full path
	assert ($r.strings1[0] -like '*\Different-FileInfo-ToString\.test.ps1')

	# just name
	assert ($r.strings2[0] -eq '.test.ps1')
}
