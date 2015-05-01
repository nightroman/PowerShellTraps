
# The same command as in "test1.expected.error.ps1" but with -Recurse:
# - In v2 it writes an error, as expected.
# - In v3+ it does not fail and gets nothing.

Get-ChildItem .\6d460559-a89d-405c-9782-42bf39b70894 -Recurse
