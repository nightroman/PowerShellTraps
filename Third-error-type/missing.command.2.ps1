
<#
Fact 2: A missing command is a terminating error in the try block.

The below test writes 'Caught' and nothing else. That is 'Continued' is not
called, i.e. the missing command is terminating.
#>

$ErrorActionPreference = 'Continue'
try {
	missing-command
	'Continued'
}
catch {
	"Caught $($_.FullyQualifiedErrorId)"
}
