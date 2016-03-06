
<#
	Test4.psd1 is designed for v3+ because it uses PowerShellVersion = '3.0'
	In PowerShell v2 it fails as expected with the clear message.

	PS> PowerShell -Version 2 -File Test4.ps1
#>

$PSScriptRoot = Split-Path $MyInvocation.MyCommand.Definition
Import-Module $PSScriptRoot\Test4.psd1 -Force
Get-Something
