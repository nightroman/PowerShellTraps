
<#
	This script is supposed to be invoked by
	- Test-1-Command-no-conflicts.ps1
	- Test-2-Command-conflicts.ps1
	- Test-3-File-conflicts.ps1
#>

# Import the module.
Import-Module .\MyModule.psm1

# Now it works "correctly", it calls MyCommand from the module.
Test-ModuleFunction

# A script function.
function Test-ScriptFunction {
	'script function Test-ScriptFunction'
}

# An alias with "accidentally" the same name as a module function.
Set-Alias MyCommand Test-ScriptFunction

# Now it may work "not correctly", it may call MyCommand from the script or
# from the module. This depends on how this script is invoked.
Test-ModuleFunction
