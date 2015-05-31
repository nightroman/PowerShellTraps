
# calls MyScript.ps1 as `PowerShell -Command .`, it shows name conflicts
PowerShell -Version $PSVersionTable.PSVersion -NoProfile -Command . .\MyScript.ps1
