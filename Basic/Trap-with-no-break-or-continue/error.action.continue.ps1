
$ErrorActionPreference = 'Continue'
trap {"Caught $_"}
throw 13
'Invoked after error.'
