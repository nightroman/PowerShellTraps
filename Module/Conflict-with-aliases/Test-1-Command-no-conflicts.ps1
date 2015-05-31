
# calls MyScript.ps1 as `PowerShell -Command`, it works without conflicts
PowerShell -Version $PSVersionTable.PSVersion -NoProfile -Command .\MyScript.ps1
