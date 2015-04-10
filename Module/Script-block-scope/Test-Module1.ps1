
Import-Module .\Module1.psm1

Invoke-ScriptBlockParameter {$message = 'New custom message.'}
