
#requires -version 3
Set-Location -LiteralPath $PSScriptRoot

# it will fail on conversion
Set-Content z.json @'
{"a": 1}
{
	"a": 2
}
'@

try {
	Get-Content z.json | ConvertFrom-Json
}
finally {
	Remove-Item z.json
}
