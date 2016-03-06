
<#
	Test3.psd1 is designed for v3+ because it uses PowerShellVersion = '3.0'
	In PowerShell v2 it fails as expected but the message is unintuitive.

	PS> PowerShell -Version 2 -File Test3.ps1
#>

$PSScriptRoot = Split-Path $MyInvocation.MyCommand.Definition
Import-Module $PSScriptRoot\Test3.psd1 -Force
Get-Something
