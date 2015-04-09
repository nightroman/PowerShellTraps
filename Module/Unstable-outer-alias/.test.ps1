
<#
.Synopsis
	Shows unstable conflicts of outer aliases and internal module functions.

.Description
	The two tests below shows different results depending on how a script is
	invoked. It's difficult to say which test works correctly. It looks like
	the rules are floating, by design or not.
#>

# Synopsis: No conflict on PowerShell -Command ...
task call-as-command {
	($r = PowerShell -Version $PSVersionTable.PSVersion -NoProfile -Command .\Test-MyModule.ps1)
	assert ($r[0] -eq 'module function MyCommand')
	assert ($r[1] -eq 'module function MyCommand')
}

# Synopsis: Conflict on PowerShell -File ...
task call-as-file {
	($r = PowerShell -Version $PSVersionTable.PSVersion -NoProfile -File .\Test-MyModule.ps1)
	assert ($r[0] -eq 'module function MyCommand')
	assert ($r[1] -eq 'script function Test-ScriptFunction')
}
