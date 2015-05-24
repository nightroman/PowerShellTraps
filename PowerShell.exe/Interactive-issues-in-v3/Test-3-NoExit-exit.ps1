
<#
	In PowerShell 3.0 "exit" in the command has no effect.
	In PowerShell 2.0 and 4.0 it works as expected, PowerShell exits.
#>

PowerShell -Version $PSVersionTable.PSVersion -NoProfile -NoExit '42; exit'
