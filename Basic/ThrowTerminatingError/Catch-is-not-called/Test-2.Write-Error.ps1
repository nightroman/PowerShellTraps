
[CmdletBinding()]
param()

$caught = 'not-caught'
try {
	# this is caught
	Write-Error 'some-error' -ErrorAction Stop
}
catch {
	$caught = 'was-caught'
	throw
}
finally {
	$caught
	'in-finally'
}
