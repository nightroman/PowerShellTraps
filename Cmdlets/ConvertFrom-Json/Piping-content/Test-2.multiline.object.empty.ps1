
#requires -version 3
Set-Location -LiteralPath $PSScriptRoot

# two objects will be returned, $null and an object
Set-Content z.json @'

{
	"a": 1,
	"b": 2
}

'@

$r = Get-Content z.json | ConvertFrom-Json
$r.Count
$null -eq $r[0]
$r

Remove-Item z.json
