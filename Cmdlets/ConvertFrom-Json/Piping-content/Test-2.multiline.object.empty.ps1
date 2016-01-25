
#requires -version 3
Set-Location -LiteralPath $PSScriptRoot

# v5: two objects are returned, the first is null
# v4: conversion fails
# v3: not tested
Set-Content z.json @'

{
	"a": 1,
	"b": 2
}

'@

try {
	$r = Get-Content z.json | ConvertFrom-Json
	$r.Count
	$null -eq $r[0]
	$r
}
finally {
	Remove-Item z.json
}
