
#requires -version 3
Set-Location -LiteralPath $PSScriptRoot

# four objects will be returned, empty lines as nulls
Set-Content z.json @'
{"a": 1}

{"a": 2}

'@

$r = Get-Content z.json | ConvertFrom-Json
$r.Count
$null -eq $r[1]
$null -eq $r[3]
$r

Remove-Item z.json
