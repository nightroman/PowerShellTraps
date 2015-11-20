
# these work and get items

Set-Location C:\
$item = Get-Item \
$item.Name

Set-Location HKCU:\
$item = Get-Item \
$item.Name

# this gets nothing in v3+ and fails in v2

Set-Location Cert:\
$item = Get-Item \ -ErrorAction Stop
$null -eq $item
