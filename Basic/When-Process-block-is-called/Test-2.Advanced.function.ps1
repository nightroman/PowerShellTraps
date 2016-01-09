
function Invoke-Test {
	[CmdletBinding()]
	param(
		[Parameter(ValueFromPipeline=1)]$MyParam
	)
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
