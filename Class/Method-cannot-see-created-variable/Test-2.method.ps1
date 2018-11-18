
# This function creates a "connection" and gives it to the caller not by
# returning but by creating its variable in the parent (caller) scope.
# So the result of the function is the variable `$Connection`.
# (Why this unusual way is used is a different story).
function Connect-Something1 {
	$Connection = "this-is-connection"
	Set-Variable -Name Connection -Value $Connection -Scope 1
}

# This class has the method with the same code as Connect-Something2, see test 1.
# It is not going to work due to "Variable is not assigned in the method."
class Connector {
	[object] Connect() {
		# create connection
		Connect-Something1

		# it fails "Variable is not assigned in the method."
		return $Connection
	}
}

# Try to use the scenario with the class and method.
$connect = [Connector]::new()
$connect.Connect()
