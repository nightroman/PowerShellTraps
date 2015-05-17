
# the script with throw produces user friendly error messages
# but it fails for valid input because it does not return true
function Test-Parameter {
	param(
		[ValidateScript({if ($_ -notmatch '^\w+$') {throw 'Name should contain alphanumeric letters and "_".'}})]
		$Name
	)
	"Name is $Name"
}

# fails due to incomplete validation, it must return $true on success
Test-Parameter valid_name
