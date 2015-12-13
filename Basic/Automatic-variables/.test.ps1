
$v2 = $PSVersionTable.PSVersion.Major -eq 2

task Test-1.Args {
	($r = .\Test-1.Args.ps1)
	assert $r[0].Equals('Param=')
	assert $r[1].Equals('Object[]')
}

task Test-2.Input {
	($r = .\Test-2.Input.ps1)
	assert $r[0].Equals('Param=')
	assert $r[1].Equals('ArrayListEnumeratorSimple')
}

task Test-3.Dollar {
	($r = .\Test-3.Dollar.ps1)
	assert $r[0].Equals('Name=Name 1')
	if ($v2) {
		assert $r[1].Equals('Name=Name 1')
	}
	else {
		assert $r[1].Equals('Name=@{Name=Name 1}.Name')
	}
}

task Test-4.Caret {
	($r = .\Test-4.Caret.ps1)
	assert $r[0].Equals('Name=Name 1')
	if ($v2) {
		assert $r[1].Equals('Name=Name 1')
	}
	else {
		assert $r[1].Equals('Name=@{Name=Name 1}.Name')
	}
}
