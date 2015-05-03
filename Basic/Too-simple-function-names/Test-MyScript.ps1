
# Now it works "correctly", it calls MyCommand from the script.
.\MyScript.ps1

# Another function
function Test-OuterFunction {
	'Outer function Test-OuterFunction'
}

# An alias "accidentally" has the same name as a script function.
Set-Alias MyCommand Test-OuterFunction

# Now it works "incorrectly", it invokes Test-OuterFunction via MyCommand.
.\MyScript.ps1
