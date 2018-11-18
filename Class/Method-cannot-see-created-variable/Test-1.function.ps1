
# This function creates a "connection" and gives it to the caller not by
# returning but by creating its variable in the parent (caller) scope.
# So the result of the function is the variable `$Connection`.
# (Why this unusual way is used is a different story).
function Connect-Something1 {
	$Connection = "this-is-connection"
	Set-Variable -Name Connection -Value $Connection -Scope 1
}

# This function calls Connect-Something1 and returns the created $Connection.
function Connect-Something2 {
	# create connection
	Connect-Something1

	# return connection
	return $Connection
}

# It returns "this-is-connection"
Connect-Something2
