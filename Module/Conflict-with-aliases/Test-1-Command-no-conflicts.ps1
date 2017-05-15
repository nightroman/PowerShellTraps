
# calls MyScript.ps1 as `PowerShell -Command`, it works without conflicts
. ../../Tools.ps1
Invoke-PowerShell -Command .\MyScript.ps1
