
# The dynamic switch ReadOnly was introduced in v3.
#requires -Version 3

# provider that does not have the dynamic ReadOnly
Set-Location env:

# works because we explicitly specify FileSystem
Get-ChildItem C:\ -ReadOnly
