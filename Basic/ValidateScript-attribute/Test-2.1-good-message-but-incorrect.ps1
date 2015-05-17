
# the script with throw produces user friendly error messages,
# it not yet correct though, see 2.2
function Test-Parameter {
	param(
		[ValidateScript({if ($_ -notmatch '^\w+$') {throw 'Name should contain alphanumeric letters and "_".'}})]
		$Name
	)
	"Name is $Name"
}

# fails with a clear message
Test-Parameter invalid-name
