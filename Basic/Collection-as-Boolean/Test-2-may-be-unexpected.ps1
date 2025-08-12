
### These not empty arrays are evaluated as $false

# number
@(0) -as [bool]

# string
@('') -as [bool]

# object
@($null) -as [bool]

# Boolean
@($false) -as [bool]
