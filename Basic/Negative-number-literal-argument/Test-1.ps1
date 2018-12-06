
# This function takes a parameter and returns its type name.
function Get-ParameterType($Param) {
	$Param.GetType().Name
}

# This argument is a number.
Get-ParameterType 9

# This argument is a string, not number.
Get-ParameterType -9

# This argument is a number due to parenthesis.
Get-ParameterType (-9)
