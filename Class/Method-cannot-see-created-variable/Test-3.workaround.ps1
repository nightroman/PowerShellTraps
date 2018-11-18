
# This function creates a "connection" and gets it to the caller not by
# returning but by creating a variable in the parent (caller) scope.
# So the result of the function is the variable `$Connection`.
# (Why this unusual way is used is a different story).
function Connect-Something1 {
	$Connection = "this-is-connection"
	Set-Variable -Name Connection -Value $Connection -Scope 1
}

# We are using an extra script block to work around the problem, see test 2.
class Connector {
	[object] Connect () {
		# create connection using an extra script block
		$Connection = &{
			Connect-Something1
			$Connection
		}

		# return connection
		return $Connection
	}
}

# It returns "this-is-connection"
$connect = [Connector]::new()
$connect.Connect()
