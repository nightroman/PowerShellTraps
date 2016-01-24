
#requires -version 3
Set-Location -LiteralPath $PSScriptRoot

# two objects will be returned
Set-Content z.json @'
{"a": 1}
{"a": 2}
'@

Get-Content z.json | ConvertFrom-Json

Remove-Item z.json
