
task AndOrPrecedence {
	($r = .\Test-CSharp.ps1)
	assert ($r -eq $true)

	($r = .\Test-PowerShell.ps1)
	assert ($r -eq $false)
}
