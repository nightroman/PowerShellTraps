
#requires -version 3
Set-Location -LiteralPath $PSScriptRoot

# one object will be returned
# trailing empty lines is not an issue
Set-Content z.json @'
{
	"a": 1,
	"b": 2
}

'@

Get-Content z.json | ConvertFrom-Json

Remove-Item z.json
