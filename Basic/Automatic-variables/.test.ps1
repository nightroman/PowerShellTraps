
$v2 = $PSVersionTable.PSVersion.Major -eq 2

task Test-1.Args {
	($r = .\Test-1.Args.ps1)
	equals $r[0] 'Param='
	equals $r[1] 'Object[]'
}

task Test-2.Input {
	($r = .\Test-2.Input.ps1)
	equals $r[0] 'Param='
	equals $r[1] 'ArrayListEnumeratorSimple'
}

task Test-3.Dollar {
	($r = .\Test-3.Dollar.ps1)
	equals $r[0] 'Name=Name 1'
	if ($v2) {
		equals $r[1] 'Name=Name 1'
	}
	else {
		equals $r[1] 'Name=@{Name=Name 1}.Name'
	}
}

task Test-4.Caret {
	($r = .\Test-4.Caret.ps1)
	equals $r[0] 'Name=Name 1'
	if ($v2) {
		equals $r[1] 'Name=Name 1'
	}
	else {
		equals $r[1] 'Name=@{Name=Name 1}.Name'
	}
}
