
task Test-1.Confusion {
	($r = .\Test-1.Confusion.ps1)
	equals ($r -join '|') 'True|True|works like expected True'
}

task Test-2.Explanation {
	($r = .\Test-2.Explanation.ps1)
	equals ($r -join '|') 'True|False|works like expected True|String'
}
