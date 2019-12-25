# How to set a variable in the caller scope.

# This works in script functions but not module functions.
function Set-CallerVariable1 {
	Set-Variable myVar1 myValue1 -Scope 1
}

# This works in module functions but not script functions.
function Set-CallerVariable2 {
	[CmdletBinding()]
	param()

	$PSCmdlet.SessionState.PSVariable.Set('myVar2', 'myValue2')
}

# This works in both cases (unlikely needed but possible).
function Set-CallerVariable3 {
	[CmdletBinding()]
	param()

	if ($MyInvocation.MyCommand.ModuleName) {
		# invoked as the module function
		$PSCmdlet.SessionState.PSVariable.Set('myVar3', 'myValue3')
	}
	else {
		# invoked as the script function
		Set-Variable myVar3 myValue3 -Scope 1
	}
}
