
[PowerShell]::Create().AddScript({
	Set-StrictMode -Version 2
	try {
		throw 'Oops!'
	}
	catch {
		'Error {'
		$_ | Format-List
		'}'
		$Error[0]
	}
}).Invoke()