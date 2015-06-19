
task Test-1-directory-with-brackets {
	($r = .\Test-1-directory-with-brackets.ps1)

	# one item "testdir"
	assert $r.NoRecurse.Name.Equals('testdir')

	if ($PSVersionTable.PSVersion.Major -eq 2) {
		# one item "testdir"
		assert $r.NoRecurse.Name.Equals('testdir')
	}
	else {
		# nothing
		assert ($null -eq $r.Recurse)
	}
}
