
[CmdletBinding()]
param()

$PSCmdlet.ThrowTerminatingError(
	(New-Object System.Management.Automation.ErrorRecord ([Exception]'invalid-input'), $null, 'InvalidOperation', $null)
)
