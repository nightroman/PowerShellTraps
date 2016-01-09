
Set-Location -LiteralPath (Split-Path $MyInvocation.MyCommand.Definition)

# two temp files
Set-Content tmp.tmp ''
Set-Content tmp.tmp2 ''

# Filter *.tmp includes "tmp.tmp2"
$r = Get-ChildItem . -Filter *.tmp
$r | Select-Object -ExpandProperty Name

# "tmp.tmp2" is also removed
Remove-Item tmp.* -Filter *.tmp
Test-Path tmp.*
