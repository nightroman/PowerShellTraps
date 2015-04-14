
$ps = [PowerShell]::Create().AddScript({
	try {
		throw 'Oops!'
	}
	catch {
		'Error {'
		$_ | Out-String
		'}'
		$Error[0]
	}
})
$ps.Invoke()