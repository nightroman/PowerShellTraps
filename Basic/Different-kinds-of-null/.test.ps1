
$v2 = $PSVersionTable.PSVersion.Major -eq 2

task Test-1-different-results {
	($r = .\Test-1-different-results.ps1)
	if ($v2) {
		assert ('True|1|1' -eq $r -join '|')
	}
	else {
		assert ('True|0|1' -eq $r -join '|')
	}
}

task Test-2-not-exactly-null {
	($r = .\Test-2-not-exactly-null.ps1)
	if ($v2) {
		assert ('PropertyNotFoundStrict|PropertyNotFoundStrict' -eq $r -join '|')
	}
	else {
		assert ('False|System.Management.Automation.PSCustomObject|True' -eq $r -join '|')
	}
}
