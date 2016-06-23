
# Import Module1 with the function Invoke-Test.

Import-Module .\Module1.psm1

# Call Invoke-Test. It fails because one of the functions defined in another
# module is not found.

Invoke-Test
