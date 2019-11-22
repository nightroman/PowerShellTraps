$Version = $PSVersionTable.PSVersion.Major
if ($Version -eq 2) {return task skipV2}

task Test-1.Issue {
	($r = .\Test-1.Issue.ps1)
	if ($Version -ge 7) {
		'Object[]|3|PSCustomObject|PSCustomObject|PSCustomObject|3'
	}
	else {
		equals ($r -join '|') 'Object[]|3|Object[]|1'
	}
}

task Test-2.Workaround {
	($r = .\Test-2.Workaround.ps1)
	equals ($r -join '|') 'PSCustomObject|PSCustomObject|PSCustomObject|3'
}

task Test-3.Workaround {
	($r = .\Test-3.Workaround.ps1)
	equals ($r -join '|') 'PSCustomObject|PSCustomObject|PSCustomObject|3'
}
