
<#
	This test produces an expected error and this error contains correct
	information about its location. It is the line with MissingCommand.
#>

function WillThrow {
	param()
	MissingCommand
}

function WillCatchAndRethrow {
	try {
		WillThrow
	}
	catch {
		throw
	}
}

WillCatchAndRethrow
