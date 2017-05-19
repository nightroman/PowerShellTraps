
task break.missing {
	($r = exec {Invoke-PowerShell -NoProfile .\break.missing.ps1})
	equals ($r -join '|') '1 1|1 2'
}

task continue.missing {
	($r = exec {Invoke-PowerShell -NoProfile .\continue.missing.ps1})
	equals ($r -join '|') '1 1|1 2'
}
