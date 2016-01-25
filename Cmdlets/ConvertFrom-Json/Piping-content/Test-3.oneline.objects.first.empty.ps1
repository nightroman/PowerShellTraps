
#requires -version 3
Set-Location -LiteralPath $PSScriptRoot

# v5: conversion fails
# v4: three objects are returned, the first is null
# v3: not tested
Set-Content z.json @'

{"a": 1}
{"a": 2}
'@

try {
	Get-Content z.json | ConvertFrom-Json
}
finally {
	Remove-Item z.json
}
