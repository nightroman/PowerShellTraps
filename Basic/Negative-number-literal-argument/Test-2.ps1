
# This potentially not safe function adds two untyped arguments.
function Get-Sum($Param1, $Param2) {
	$Param1 + $Param2
}

# -1, accidentally OK. The first argument is number, the second is string, on
# adding converted to number. As a result, two numbers are added.
Get-Sum 1 -2

# "-21", probably NOT OK. The first argument is string, the second is number,
# on adding converted to string. As a result, two strings are concatenated.
Get-Sum -2 1
