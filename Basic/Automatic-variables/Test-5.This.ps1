
<#
	PowerShell v3

		This command crashes

			PowerShell.exe -File .\Test-5.This.ps1

		This command works but shows a strange error

			PowerShell.exe .\Test-5.This.ps1


	PowerShell v2

		These commands work and show expected errors

			PowerShell.exe -Version 2 -File .\Test-5.This.ps1
			PowerShell.exe -Version 2 .\Test-5.This.ps1
#>

[DateTime]$this = 'invalid'
