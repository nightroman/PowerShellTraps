
Set-Location -LiteralPath (Split-Path $MyInvocation.MyCommand.Definition)

# file name with no dots
Set-Content tmp ''

# Filter *.* includes "tmp"
$r = Get-ChildItem . -Filter *.*
$r | Select-Object -ExpandProperty Name

# clean
Remove-Item tmp
