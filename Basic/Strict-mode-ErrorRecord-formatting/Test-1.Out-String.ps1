# v6-rc: fixed
# v7.0.0-rc.1: fails "The property 'ErrorCategory_Message' cannot be found on this object."

[PowerShell]::Create().AddScript({
	$ErrorView = 'NormalView' #! v7
	Set-StrictMode -Version 2
	try {
		throw 'Oops!'
	}
	catch {
		'Error {'
		$_ | Out-String
		'}'
		$Error[0]
	}
}).Invoke()