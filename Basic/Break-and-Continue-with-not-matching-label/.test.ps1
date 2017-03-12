
$Version = $PSVersionTable.PSVersion

task break.missing {
	($r = exec {PowerShell -Version $Version -NoProfile .\break.missing.ps1})
	equals ($r -join '|') '1 1|1 2'
}

task continue.missing {
	($r = exec {PowerShell -Version $Version -NoProfile .\continue.missing.ps1})
	equals ($r -join '|') '1 1|1 2'
}
