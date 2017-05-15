
. ../../Tools.ps1

task break.missing {
	($r = exec {Invoke-PowerShell .\break.missing.ps1})
	equals ($r -join '|') '1 1|1 2'
}

task continue.missing {
	($r = exec {Invoke-PowerShell .\continue.missing.ps1})
	equals ($r -join '|') '1 1|1 2'
}
