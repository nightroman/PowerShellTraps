# `Get-WmiObject` - amended WMI data may fail in the strict mode `Latest`

The issue is observed in PowerShell v5 and v4, not v2.
PowerShell v3 is not tested.

Scripts

- [Test-1.strict.v2.ps1](Test-1.strict.v2.ps1) works in the normal or strict mode `-Version 2`
- [Test-2.strict.latest.ps1](Test-2.strict.latest.ps1) fails in the strict mode `-Version Latest`

***

- Discussion of [PowerShellPracticeAndStyle/issues/51](https://github.com/PoshCode/PowerShellPracticeAndStyle/issues/51)
