
# Expression with a non-terminating error
$expression = 'Write-Error "non-terminating error"'

# This value actually controls errors
$ErrorActionPreference = 'Stop'

# -ErrorAction Continue is "ignored" and the script stops
Invoke-Expression -Command $expression -ErrorAction Continue

# This is not invoked
throw 'This should not be invoked'
