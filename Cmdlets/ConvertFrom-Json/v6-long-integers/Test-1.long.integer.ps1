
#requires -version 3

Set-Location -LiteralPath $PSScriptRoot
Set-Content z.json '{ "a": 1 }'

# v6: one object is returned, trailing empty lines is not an issue
# v5-: one object is returned, trailing empty lines is not an issue
$r = Get-Content z.json | ConvertFrom-Json
$r.a.GetType().FullName

Remove-Item z.json
