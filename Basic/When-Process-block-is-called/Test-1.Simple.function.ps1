
function Invoke-Test {
	begin {
		'begin'
	}
	process {
		'process'
	}
	end {
		'end'
	}
}

# process is called
$r = Invoke-Test
$r
$r -contains 'process'

# process is not called
$r = @() | Invoke-Test
$r
$r -contains 'process'
