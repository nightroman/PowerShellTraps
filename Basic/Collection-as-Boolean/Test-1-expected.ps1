
### These not empty arrays are evaluated as $true

# number
@(42) -as [bool]

# string
@('abc') -as [bool]

# object
@($Host) -as [bool]

# Boolean
@($true) -as [bool]
