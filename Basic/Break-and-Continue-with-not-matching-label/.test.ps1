
$Version = $PSVersionTable.PSVersion

task break.missing {
	($r = PowerShell -Version $Version -NoProfile .\break.missing.ps1)
	equals $LASTEXITCODE 0
	equals ($r -join '|') '1 1|1 2'
}

task continue.missing {
	($r = PowerShell -Version $Version -NoProfile .\continue.missing.ps1)
	equals $LASTEXITCODE 0
	equals ($r -join '|') '1 1|1 2'
}
