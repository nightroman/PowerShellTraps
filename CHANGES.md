
### v6.1.0-preview.1

- [Count-and-Length\PSCustomObject](Basic\Count-and-Length\PSCustomObject)
-- Fixed
- [Number-of-returned-objects](Basic\Number-of-returned-objects)
-- Fixed for `PSCustomObject`, same as above
- [Get-ChildItem\Directory-with-backticks](Cmdlets\Get-ChildItem\Directory-with-backticks)
-- `Get-ChildItem` does not fail in the empty directory but still fails in not empty
- [v5-LiteralPath-Recurse-ignores-Include](Cmdlets\Get-ChildItem\v5-LiteralPath-Recurse-ignores-Include)
-- Fixed the v5 regression
- [PowerShell.exe\Unexpected-start-location](PowerShell.exe\Unexpected-start-location)
-- Fixed

### v6-RC

- [Strict-mode-ErrorRecord-formatting](Basic\Strict-mode-ErrorRecord-formatting)
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
