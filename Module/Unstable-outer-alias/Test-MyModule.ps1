
# import the test module
Import-Module .\MyModule.psm1

# Now it works "correctly", it calls MyCommand from the module.
Test-ModuleFunction

# A script function.
function Test-ScriptFunction {
	'script function Test-ScriptFunction'
}

# An alias that "accidentally" has the same name as an internal module command.
Set-Alias MyCommand Test-ScriptFunction

# Now it may work "not correctly", it may call MyCommand from the script or
# from the module. This depends on how this script itself is invoked.
Test-ModuleFunction
