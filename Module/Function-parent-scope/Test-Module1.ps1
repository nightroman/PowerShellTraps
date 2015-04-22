
# import module
Import-Module .\Module1.psm1

# call its function
New-Variable1

# this fails
Get-Variable -Name Variable1 -Scope 0
