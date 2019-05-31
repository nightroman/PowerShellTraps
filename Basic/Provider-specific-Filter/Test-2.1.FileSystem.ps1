
Set-Location -LiteralPath (Split-Path $MyInvocation.MyCommand.Definition)

# file name with no dots
Set-Content tmp ''

# Filter *.* includes "tmp" in v2-v5, v7. But v6 excludes "tmp"
$r = Get-ChildItem . -Filter *.*
$r | Select-Object -ExpandProperty Name

# clean
Remove-Item tmp
