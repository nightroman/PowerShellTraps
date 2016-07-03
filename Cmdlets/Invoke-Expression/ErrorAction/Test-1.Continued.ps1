
# Expression with a non-terminating error
$expression = 'Write-Error "non-terminating error"'

# This value actually controls errors
$ErrorActionPreference = 'Continue'

# -ErrorAction Stop is "ignored" and the script continues
Invoke-Expression -Command $expression -ErrorAction Stop

# This is invoked
'Continued'
