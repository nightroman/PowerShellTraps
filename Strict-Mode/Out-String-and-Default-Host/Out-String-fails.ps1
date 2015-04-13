
$ps = [PowerShell]::Create().AddScript({

	Set-StrictMode -Version 2

	function Test {
		throw 'Oops!'
	}

	try {
		Test
	}
	catch {
		'Error {'
		$_ | Out-String
		'}'
		$Error[0]
	}
})

$ps.Invoke()