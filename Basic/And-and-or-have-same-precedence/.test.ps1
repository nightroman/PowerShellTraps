
task AndOrPrecedence {
	($r = .\Test-CSharp.ps1)
	equals $r $true

	($r = .\Test-PowerShell.ps1)
	equals $r $false
}
