
if ($PSVersionTable.PSVersion.Major -le 2) {return task v2}

task Test-1 {
	($r = .\Test-1.ps1)
	equals $r.Count 2
	assert ($r[0] -like '*# Pear*')
	assert ($r[1] -notlike '*# Pear*')
}
