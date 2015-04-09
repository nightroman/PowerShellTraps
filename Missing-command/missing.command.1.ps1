
<#
Fact 1: A missing command is not a terminating error.

It writes a non-terminating error and then 'Continued ...', as expected.
Note that there is no try or trap statements in this example.
#>

function MissingCommandIsNotTerminating {
	$ErrorActionPreference = 'Continue'
	missing-command
	'Continued after missing-command'
}

MissingCommandIsNotTerminating
