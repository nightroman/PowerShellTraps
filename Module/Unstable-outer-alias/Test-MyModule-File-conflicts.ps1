
# calls Test-MyModule.ps1 as `PowerShell -File`, it shows name conflicts
PowerShell -Version $PSVersionTable.PSVersion -NoProfile -File Test-MyModule.ps1
