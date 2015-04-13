
$ps = [PowerShell]::Create().AddScript({

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