
# the default error action preference
$ErrorActionPreference = 'Continue'

# specify -ErrorAction Stop in order to stop on errors
# (alternatively set $ErrorActionPreference = 'Stop')
Import-Module .\MissingModule -ErrorAction Stop

# this is not invoked
'not invoked'
