
$v2 = $PSVersionTable.PSVersion.Major -eq 2

task Test-1-different-results {
	($r = .\Test-1-different-results.ps1)
	if ($v2) {
		equals 'True|1|1' ($r -join '|')
	}
	else {
		equals 'True|0|1' ($r -join '|')
	}
}

task Test-2-not-exactly-null {
	($r = .\Test-2-not-exactly-null.ps1)
	if ($v2) {
		equals 'PropertyNotFoundStrict|PropertyNotFoundStrict' ($r -join '|')
	}
	else {
		equals 'False|System.Management.Automation.PSCustomObject|True' ($r -join '|')
	}
}
