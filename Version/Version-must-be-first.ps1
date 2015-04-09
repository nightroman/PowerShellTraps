
<#
.Synopsis
	The PowerShell parameter Version must be the first.

.Description
	This works:

		PowerShell -Version 2 -NoProfile

	This does not:

		PowerShell -NoProfile -Version 2
#>

PowerShell -NoProfile -Version 2
