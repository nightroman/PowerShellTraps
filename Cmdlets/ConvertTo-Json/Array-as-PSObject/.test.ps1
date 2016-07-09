
if ($PSVersionTable.PSVersion.Major -le 2) {return task v2}

task Test-1.unexpected {
	($r = .\Test-1.unexpected.ps1)

	equals $r.Count 2
	equals $r[0] 'Object[]'

	$r2 = $r[1] | ConvertFrom-Json
	equals $r2.Value[0] 1
	equals $r2.Value[1] 2
}

task Test-2.expected {
	($r = .\Test-2.expected.ps1)

	$r2 = $r | ConvertFrom-Json
	equals $r2[0] 1
	equals $r2[1] 2
}
