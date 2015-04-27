
<#
Fact 3: A missing command is a terminating error in the same script
"missing.command.1.ps1" where it was not terminating.

The difference is that the script is now called from a try block.
#>

try {
	.\missing.command.1.ps1
}
catch {
	"Caught $($_.FullyQualifiedErrorId)"
}
