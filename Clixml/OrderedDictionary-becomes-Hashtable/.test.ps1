
$Version = $PSVersionTable.PSVersion
$v7_3_0 = [version]'7.3.0'

task Test-OrderedDictionary {
	($r = .\Test-OrderedDictionary.ps1)
	equals $r.Count 2
	equals $r[0] OrderedDictionary
	if ($Version -ge $v7_3_0) {
		equals $r[0] OrderedDictionary
	}
	else {
		equals $r[1] 'Hashtable'
	}
}
