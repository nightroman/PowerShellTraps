
<#
.Synopsis
	The command PowerShell.exe may invoke an unwanted version.

.Description
	If a script invokes PowerShell.exe and does not specify the version then a
	newer PowerShell may be be invoked. This is potentially unwanted, e.g. if a
	script to be invoked works differently with a newer version, the fact which
	may be yet unknown on development and deployment.

.Example
	>PowerShell -Version 2 .\Unwanted-version.ps1
	Output:
	3.0 (or above, potentially unwanted)
	2.0
#>

# This may invoke a newer version, potentially unwanted
PowerShell -NoProfile '$PSVersionTable.PSVersion.ToString()'

# Ensure the same version
PowerShell -Version $PSVersionTable.PSVersion -NoProfile '$PSVersionTable.PSVersion.ToString()'
