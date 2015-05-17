
# the script with throw produces user friendly error messages and returns true
# for valid input, all is fine but the script is somewhat lengthy, as a result
function Test-Parameter {
	param(
		[ValidateScript({if ($_ -match '^\w+$') {$true} else {throw 'Name should contain alphanumeric letters and "_".'}})]
		$Name
	)
	"Name is $Name"
}

# works
Test-Parameter valid_name

# fails with a clear message
Test-Parameter invalid-name
