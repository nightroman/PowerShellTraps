
# UNC path and some file
$path = "\\server\test"
$file = 'test.txt'

# Expected result if the current provider is FileSystem: \\server\test\test.txt
Set-Location C:
Join-Path $path $file

# May be unexpected if the current provider is Function: test.txt
Set-Location Function:
Join-Path $path $file
