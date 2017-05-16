
[CmdletBinding()]
param()

$caught = 'not-caught'
try {
	# this is not caught in v5 (works in v2)
	$PSCmdlet.ThrowTerminatingError((New-Object System.Management.Automation.ErrorRecord ([Exception]'some-error'), $null, 0, $null))
}
catch {
	$caught = 'was-caught'
	throw
}
finally {
	$caught
	'in-finally'
}
