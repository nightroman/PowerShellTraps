
# to ensure PowerShell.exe version
$Version = $PSVersionTable.PSVersion

# results to be tested
$results = New-Object System.Collections.Specialized.OrderedDictionary

# Q: What happens if PowerShell invokes this command?
# A: It exits with code 1.
$results.text1 = PowerShell -Version $Version -NoProfile "'Hello'; Write-Error Oops"
$results.code1 = $LASTEXITCODE

# Q: What happens if PowerShell invokes the same command as a script?
# A: It exits with code 0.
$results.text2 = PowerShell -Version $Version -NoProfile .\Script1.ps1
$results.code2 = $LASTEXITCODE

# Q: What if the same script is dot-sourced as if its code is placed here?
# A: It exits with code 0.
$results.text3 = PowerShell -Version $Version -NoProfile . .\Script1.ps1
$results.code3 = $LASTEXITCODE

# Q: What if the command last statement has no error?
# A: It exits with code 0.
$results.text4 = PowerShell -Version $Version -NoProfile "Write-Error Oops; 'Hello'"
$results.code4 = $LASTEXITCODE

# results for testing
$results
