
<#
	This script works in any PowerShell, including v2. Example:
	PS> PowerShell -Version 2 -File Test2.ps1
#>

$PSScriptRoot = Split-Path $MyInvocation.MyCommand.Definition
Import-Module $PSScriptRoot\Test2.psd1 -Force
Get-Something
