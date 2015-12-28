
<#
	This script fails in PowerShell v2. Example:
	PS> PowerShell -Version 2 -File Test1.ps1
#>

$PSScriptRoot = Split-Path $MyInvocation.MyCommand.Definition
Import-Module $PSScriptRoot\Test1.psd1
Get-Test1
