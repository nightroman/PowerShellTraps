
<#
.Synopsis
	Shows unstable conflicts of outer aliases and internal module functions.

.Description
	The two tests below shows different results depending on how a script is
	invoked. It's difficult to say which test works correctly. It looks like
	the rules are floating, by design or not.
#>

# Synopsis: No conflict on PowerShell -Command ...
task Test-MyModule-Command-works {
	($r = .\Test-MyModule-Command-works.ps1)
	assert ('module function MyCommand|module function MyCommand' -eq $r -join '|')
}

# Synopsis: Conflict on PowerShell -File ...
task Test-MyModule-File-conflicts {
	($r = .\Test-MyModule-File-conflicts.ps1)
	assert ('module function MyCommand|script function Test-ScriptFunction' -eq $r -join '|')
}
