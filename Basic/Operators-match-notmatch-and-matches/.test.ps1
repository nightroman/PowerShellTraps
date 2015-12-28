
task Test-1.match {
	($r = .\Test-1.match.ps1)
	equals ($r -join '|') 'True|Fi Fo|False|Fi Fo'
}

task Test-2.notmatch {
	($r = .\Test-2.notmatch.ps1)
	equals ($r -join '|') 'False|Fi Fo|True|Fi Fo'
}

task Test-3.regex {
	($r = .\Test-3.regex.ps1)
	equals ($r -join '|') 'True|Fi Fo|False|'
}
