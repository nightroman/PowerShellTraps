
<#
	Invoke this script using PowerShell.exe v3.0 without -NoExit.
	When Write-Debug shows its prompt choose "s" for "Suspend".
	Note that it is ignored, the nested prompt is not shown.
#>

$DebugPreference = 'Inquire'
Write-Debug test
