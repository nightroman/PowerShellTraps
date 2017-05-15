
# A function with dynamicparam, begin, process, and end blocks
function Test-ExpectingInput([Parameter(ValueFromPipeline=1)]$Dummy) {
	dynamicparam {
		$r = @()
		# False, unexpected
		# v6: True, expected
		$r += $MyInvocation.ExpectingInput
	}
	begin {
		# True
		$r += $MyInvocation.ExpectingInput
	}
	process {
		# True
		$r += $MyInvocation.ExpectingInput
	}
	end {
		# True
		$r += $MyInvocation.ExpectingInput
		$r -join ' '
	}
}

# Invoke the function with a pipeline input
1 | Test-ExpectingInput
