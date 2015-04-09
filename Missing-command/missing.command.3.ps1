
<#
Fact 3: A missing command can be a terminating error in the same function
MissingCommandIsNotTerminating ("missing.command.1.ps1") if it is called
from a try block.
#>

function MissingCommandIsNotTerminating {
	$ErrorActionPreference = 'Continue'
	missing-command
	'Continued'
}

try {
	MissingCommandIsNotTerminating
}
catch {
	'Caught'
}
