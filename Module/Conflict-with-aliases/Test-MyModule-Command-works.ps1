
# calls Test-MyModule.ps1 as `PowerShell -Command`, it works as expected
PowerShell -Version $PSVersionTable.PSVersion -NoProfile -Command .\Test-MyModule.ps1
