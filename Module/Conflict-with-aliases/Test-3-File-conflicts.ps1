
# calls MyScript.ps1 as `PowerShell -File`, it shows name conflicts
. ../../Tools.ps1
Invoke-PowerShell -File MyScript.ps1
