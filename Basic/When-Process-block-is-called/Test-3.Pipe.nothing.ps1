
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

function Get-Nothing {
}

### Test 1. Nothing is piped further directly.
# process is not called
$r = Get-Nothing | Invoke-Test
$r
$r -contains 'process'

### Test 2. Nothing is piped via a variable.
# process is not called in v5, v4
# process is called in v2
# not tested for v3 (feedback, please)
$nothing = Get-Nothing
$r = $nothing | Invoke-Test
$r
$r -contains 'process'
