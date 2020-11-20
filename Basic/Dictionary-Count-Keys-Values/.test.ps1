
task Test-1.Hashtable {
	($r = ./Test-1.Hashtable.ps1)
	equals ($r -join '|') 'Count: 42|Keys: 1|Values: 2'
}

task Test-2.Dictionary {
	($r = ./Test-2.Dictionary.ps1)
	equals ($r -join '|') 'Count: 42|Keys: 1|Values: 2'
}

task Test-3.Workaround {
	($r = ./Test-3.Workaround.ps1)
	equals ($r -join '|') 'Count: 3|Keys: Count Keys Values|Values: 1 2 42'
}
