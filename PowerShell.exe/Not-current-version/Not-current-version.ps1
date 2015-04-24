
if ($PSVersionTable.PSVersion.Major -ne 2) {
	Write-Warning '
	This test is designed for v2. Example:
	PS> PowerShell -Version 2 .\Not-current-version.ps1'
}

# This may invoke a newer version, potentially unwanted
PowerShell -NoProfile '$PSVersionTable.PSVersion.ToString()'

# Ensure the same version
PowerShell -Version $PSVersionTable.PSVersion -NoProfile '$PSVersionTable.PSVersion.ToString()'
