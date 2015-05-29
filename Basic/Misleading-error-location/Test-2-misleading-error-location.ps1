
<#
	This test produces an expected error but this error contains misleading
	information about its location. It points to the line with WillThrow
	instead of the line with MissingCommand.

	The difference between tests 1 and 2 is CmdletBinding in WillThrow in 2.

	Note that PowerShell 2.0 does not have such an issue.
#>

function WillThrow {
	[CmdletBinding()]
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
