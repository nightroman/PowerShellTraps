
Import-Module .\Module2.psm1

Invoke-ScriptBlockParameter {$message = 'New custom message.'}
