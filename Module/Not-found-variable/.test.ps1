
task Test-Script2 {
	($r = .\Test-Script2.ps1)
	equals $r $true
}

task Test-Module2 {
	($r = .\Test-Module2.ps1)
	equals $r $false
}
