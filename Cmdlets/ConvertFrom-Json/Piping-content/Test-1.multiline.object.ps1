
#requires -version 3
Set-Location -LiteralPath $PSScriptRoot

# v5: one object is returned, trailing empty lines is not an issue
# v4: conversion fails
# v3: not tested
Set-Content z.json @'
{
	"a": 1,
	"b": 2
}

'@

try {
	Get-Content z.json | ConvertFrom-Json
}
finally {
	Remove-Item z.json
}
