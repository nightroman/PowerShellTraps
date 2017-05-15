
# dot-sources MyScript.ps1 as `PowerShell -Command .`, it shows name conflicts
. ../../Tools.ps1
Invoke-PowerShell -Command . .\MyScript.ps1
