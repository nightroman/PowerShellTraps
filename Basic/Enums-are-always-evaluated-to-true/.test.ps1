
task object-looks-like-0-and-true {
	($r = .\object-looks-like-0-and-true.ps1)

	if ($PSVersionTable.PSVersion.Major -ge 5) {
		assert $r.Equals('An object is equal to 0.')
	}
	else {
		assert $r[0].Equals('An object is equal to 0.')
		assert $r[1].Equals('But it is evaluated to true.')
	}
}
