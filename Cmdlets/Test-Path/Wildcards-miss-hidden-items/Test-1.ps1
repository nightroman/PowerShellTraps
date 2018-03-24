
# make a directory "z" and a hidden item "hidden" in it
Set-Location -LiteralPath (Split-Path $MyInvocation.MyCommand.Path)
Remove-Item [z] -Force -Recurse
$item = mkdir z\hidden
$item.Attributes = $item.Attributes -bor [System.IO.FileAttributes]::Hidden

# True, expected
$r = Test-Path z\hidden
"Test-Path z\hidden = $r"

# False, unexpected
$r = Test-Path *\hidden
"Test-Path *\hidden = $r"

# False, unexpected
$r = Test-Path z\*
"Test-Path z\* = $r"
