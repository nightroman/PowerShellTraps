
# make a hidden file temp.txt
$item = New-Item temp.txt -ItemType File -Force
$item.Attributes = $item.Attributes -bor [System.IO.FileAttributes]::Hidden

# Resolved path, expected
$r = Resolve-Path temp.txt
"Resolve-Path temp.txt = $r"

# Nothing, may be unexpected
$r = Resolve-Path temp.*
"Resolve-Path temp.* = $r"

# clean
Remove-Item temp.txt -Force
