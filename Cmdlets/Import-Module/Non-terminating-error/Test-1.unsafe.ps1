
# the default error action preference
$ErrorActionPreference = 'Continue'

# it fails with a non-terminating error
Import-Module .\MissingModule

# the script continues
'invoked'

# try does not help because it is not catching non-terminating errors
try {
	Import-Module .\MissingModule
}
catch {
	throw 'caught'
}

# the script continues
'invoked'
