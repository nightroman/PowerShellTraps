# Init test variables with empty values.
$myVar1 = ''
$myVar2 = ''
$myVar3 = ''

# Dot-source script functions
. .\Lib.ps1

# Invoke functions
Set-CallerVariable1
Set-CallerVariable2
Set-CallerVariable3

# Show results
"myVar1=$myVar1" # set
"myVar2=$myVar2" # not set
"myVar3=$myVar3" # set
