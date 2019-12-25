# Init test variables with empty values.
$myVar1 = ''
$myVar2 = ''
$myVar3 = ''

# Import module functions
Import-Module .\SetVariable.psm1

# Invoke functions
Set-CallerVariable1
Set-CallerVariable2
Set-CallerVariable3

# Show results
"myVar1=$myVar1" # not set
"myVar2=$myVar2" # set
"myVar3=$myVar3" # set
