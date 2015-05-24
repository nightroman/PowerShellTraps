
<#
	Invoke this script using PowerShell.exe v3.0 without -NoExit.
	Note that $Host.EnterNestedPrompt() is ignored.
#>

'Before nested prompt'
$Host.EnterNestedPrompt()
'After nested prompt'
