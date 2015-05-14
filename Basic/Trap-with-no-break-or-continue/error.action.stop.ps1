
$ErrorActionPreference = 'Stop'
trap {"Caught $_"}
throw 13
'Not invoked after error.'
