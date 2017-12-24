
if ($PSVersionTable.PSVersion.Major -le 2) {return task v2}

task Test-1.normal.vs.custom {
	($r = ./Test-1.normal.vs.custom.ps1)
	equals $r.Count 2
	equals $r[0] 'normal.Count: 1'
	equals $r[1] 'custom.Count: '
}

task Test-2.Select-Object {
	($r = ./Test-2.Select-Object.ps1)
	equals $r.Count 4
	equals $r[0] 'Get-Some 2 : 2'
	equals $r[1] 'Get-Some 1 : 1'
	equals $r[2] 'Get-Some 2 | Select-Object : 2'
	equals $r[3] 'Get-Some 1 | Select-Object : '
}
