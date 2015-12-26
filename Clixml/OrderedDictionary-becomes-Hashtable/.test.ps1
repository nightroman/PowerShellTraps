
task Test-OrderedDictionary {
	($r = .\Test-OrderedDictionary.ps1)
	equals $r.Count 2
	equals $r[0] 'OrderedDictionary'
	equals $r[1] 'Hashtable'
}
