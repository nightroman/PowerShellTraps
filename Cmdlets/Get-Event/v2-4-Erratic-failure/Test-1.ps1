
<#
	In PowerShell v2, v3, v4 this script works for some time and eventually fails:
	Get-Event : Collection was modified; enumeration operation may not execute.

	For example, invoke by v2

		PowerShell -Version 2 .\Test-1.ps1

	and let it to work. Normally it fails in a few seconds.
#>

$PSScriptRoot = Split-Path $MyInvocation.MyCommand.Path

# start events.ps1 as a separate process
$process = Start-Process PowerShell.exe -ArgumentList $PSScriptRoot\events.ps1 -PassThru

try {
	& "$PSScriptRoot\handle.ps1" $PSScriptRoot
}
finally {
	Stop-Process -Id $process.Id -ErrorAction 0
	Remove-Item z.txt
}
