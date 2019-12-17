### v7.0.0-rc.1

- [Basic/Strict-mode-ErrorRecord-formatting](Basic/Strict-mode-ErrorRecord-formatting)
-- started to fail again, was fixed in v6 - v7.0.0-preview.6

### v7.0.0-preview.6

- [Cmdlets/ConvertFrom-Json/Not-unrolled-result](Cmdlets/ConvertFrom-Json/Not-unrolled-result)
-- The result is unrolled, "more expected"

### v7.0.0-preview.5

- [PowerShell.exe/Exit-code-0-with-Command-syntax-error](PowerShell.exe/Exit-code-0-with-Command-syntax-error)
-- exit code is 1 as usual but there is no error message printed

### v7.0.0-preview.4

- [Basic/Missing-ternary-operator](Basic/Missing-ternary-operator)
-- PowerShell introduces the ternary operator

### v7.0.0-preview.1

- [Basic/Invocation-with-odd-paths](Basic/Invocation-with-odd-paths)
-- Some fixes or changes
- [Basic/Provider-specific-Filter](Basic/Provider-specific-Filter)
-- Changed as it was before v6
- [Group-Object/Expression-with-no-value](Cmdlets/Group-Object/Expression-with-no-value)
-- Fixed

### v6.2.0-preview.4

- [Basic/FormatEnumerationLimit](Basic/FormatEnumerationLimit)
-- Different representation of truncated outputs.

### v6.2.0-preview.3

- [Test-Path/Incorrect-in-odd-location](Cmdlets/Test-Path/Incorrect-in-odd-location)
-- Fixed

### v6.2.0-preview.2

- [Basic/Provider-specific-Filter](Basic/Provider-specific-Filter)
-- Changed, `*.*` works more like PowerShell wildcard.
- [Get-Item/Directory-with-brackets](Cmdlets/Get-Item/Directory-with-brackets)
-- Fixed
- [Remove-Item/Directory-with-brackets](Cmdlets/Remove-Item/Directory-with-brackets)
-- Fixed
- [Test-Path/Incorrect-in-odd-location](Cmdlets/Test-Path/Incorrect-in-odd-location)
-- Fixed

### v6.1.0-preview.4

- [Get-ChildItem/Directory-with-backticks](Cmdlets/Get-ChildItem/Directory-with-backticks)
-- Regression, it worked better in v6.1.0-preview.3
- [Group-Object/AsHashTable](Cmdlets/Group-Object/AsHashTable)
-- Fixed *Test-2.expression.string.ps1*

### v6.1.0-preview.3

- [Get-ChildItem/Different-FileInfo-ToString](Cmdlets/Get-ChildItem/Different-FileInfo-ToString)
-- Fixed

### v6.1.0-preview.1

- [Count-and-Length/PSCustomObject](Basic/Count-and-Length/PSCustomObject)
-- Fixed
- [Number-of-returned-objects](Basic/Number-of-returned-objects)
-- Fixed for `PSCustomObject`, same as above
- [Get-ChildItem/Directory-with-backticks](Cmdlets/Get-ChildItem/Directory-with-backticks)
-- `Get-ChildItem` does not fail in the empty directory but still fails in not empty
- [Get-ChildItem/v5-LiteralPath-Recurse-ignores-Include](Cmdlets/Get-ChildItem/v5-LiteralPath-Recurse-ignores-Include)
-- Fixed the v5 regression
- [PowerShell.exe/Unexpected-start-location](PowerShell.exe/Unexpected-start-location)
-- Fixed

### v6-RC

- [Strict-mode-ErrorRecord-formatting](Basic/Strict-mode-ErrorRecord-formatting)
-- Fixed

### v6-beta.9

- [PowerShell.exe/Not-current-version](PowerShell.exe/Not-current-version)
-- The trap is back due to the renamed powershell.exe to pwsh.exe
- [PowerShell.exe/Version-parameter](PowerShell.exe/Version-parameter)
-- Anything after `-Version` is silently ignored.

### v6-beta.7

- [PowerShell.exe/Not-current-version](PowerShell.exe/Not-current-version)
-- Fixed the v6 specific issue (Example 2, Not-same-exe.ps1)
- [PowerShell.exe/Version-parameter](PowerShell.exe/Version-parameter)
-- `-Version` has different meaning in v6 (revealed in this update).
- [PowerShell.exe/Version-scriptblock-host-problem](PowerShell.exe/Version-scriptblock-host-problem)
-- `-Version` has different meaning in v6 (revealed in this update).

### v6-beta.5

- [PowerShell.exe/Switch-parameter-with-value](PowerShell.exe/Switch-parameter-with-value)
-- Allow passing $true/$false as a parameter to scripts using powershell.exe -File

### v6-beta.3

- [PowerShell.exe/Positional-Command-File](PowerShell.exe/Positional-Command-File)
-- Breaking change: Change positional parameter from `-Command` to `-File`
- [Cmdlets/Start-Transcript/v5-Unexpected-stop](Cmdlets/Start-Transcript/v5-Unexpected-stop)
-- Fixed

### v6-beta.1

- [Basic/DynamicParam/ExpectingInput-is-false](Basic/DynamicParam/ExpectingInput-is-false)
-- Fixed
- [Basic/Properties-of-XmlNode](Basic/Properties-of-XmlNode)
-- Fixed "Adapted properties accept only string values"
- [Cmdlets/ConvertFrom-Json/v6-long-integers](Cmdlets/ConvertFrom-Json/v6-long-integers)
-- Integers are returned as `[long]`, not `[int]`
- [Cmdlets/ConvertTo-Json/Array-as-PSObject](Cmdlets/ConvertTo-Json/Array-as-PSObject)
-- Fixed
- [PowerShell.exe/Not-current-version](PowerShell.exe/Not-current-version)
-- Minor traps on playing with v6 on Windows
