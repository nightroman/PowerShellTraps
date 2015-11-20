
# these work and get items

$item = Get-Item C:\
$item.Name

$item = Get-Item HKCU:\
$item.Name

# this gets nothing in v3+ and fails in v2

$item = Get-Item Cert:\ -ErrorAction Stop
$null -eq $item
