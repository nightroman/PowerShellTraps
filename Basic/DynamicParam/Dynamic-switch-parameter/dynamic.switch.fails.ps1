
# The dynamic switch ReadOnly was introduced in v3.
#requires -Version 3

# provider that does not have the dynamic ReadOnly
Set-Location env:

# fails even though we explicitly specify FileSystem
Get-ChildItem -ReadOnly C:\
