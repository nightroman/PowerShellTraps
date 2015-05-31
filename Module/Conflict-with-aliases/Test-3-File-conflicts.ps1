
# calls MyScript.ps1 as `PowerShell -File`, it shows name conflicts
PowerShell -Version $PSVersionTable.PSVersion -NoProfile -File MyScript.ps1
