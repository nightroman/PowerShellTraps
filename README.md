
PowerShell is a great tool. But it is not perfect. This is not a problem if one
knows the traps and ways to avoid them. *PowerShellTraps* is a collection of
some traps and oddities shown by demo scripts and covered by automated tests.
One of the goals is to test future PowerShell versions and see what changes.

Note that for simplicity some demo scripts require that the current PowerShell
location is set to their directory. But this is not needed for automated tests,
they take care of proper current locations themselves. See also [TESTS].

Contributions are welcome. Please read [CONTRIBUTING].

[CONTRIBUTING]: https://github.com/nightroman/PowerShellTraps/blob/master/CONTRIBUTING.md
[TESTS]: https://github.com/nightroman/PowerShellTraps/blob/master/TESTS.md

---
### Traps

<!--Generated-->
- [Clixml](./Clixml)
    - [Hashtable-case-sensitivity](./Clixml/Hashtable-case-sensitivity)
    - [OrderedDictionary-becomes-Hashtable](./Clixml/OrderedDictionary-becomes-Hashtable)
    - [v2-no-LiteralPath](./Clixml/v2-no-LiteralPath)
- [Cmdlet](./Cmdlet)
    - [ConvertTo-Json](./Cmdlet/ConvertTo-Json)
    - [Get-ChildItem](./Cmdlet/Get-ChildItem)
        - [Different-FileInfo-ToString](./Cmdlet/Get-ChildItem/Different-FileInfo-ToString)
        - [Missing-path-with-Recurse](./Cmdlet/Get-ChildItem/Missing-path-with-Recurse)
    - [Get-Item](./Cmdlet/Get-Item)
    - [Get-Unique](./Cmdlet/Get-Unique)
    - [Import-Csv](./Cmdlet/Import-Csv)
    - [Set-Content](./Cmdlet/Set-Content)
    - [Test-Path](./Cmdlet/Test-Path)
    - [Write-Progress](./Cmdlet/Write-Progress)
- [Features](./Features)
    - [And-and-or-have-same-precedence](./Features/And-and-or-have-same-precedence)
    - [Dynamic-switch-parameter](./Features/Dynamic-switch-parameter)
    - [Enums-are-always-evaluated-to-true](./Features/Enums-are-always-evaluated-to-true)
    - [Extra-properties-of-IDictionary](./Features/Extra-properties-of-IDictionary)
    - [Logical-operators-with-collections](./Features/Logical-operators-with-collections)
    - [Null-converted-to-empty-string](./Features/Null-converted-to-empty-string)
    - [Switch-is-a-looping-construct](./Features/Switch-is-a-looping-construct)
    - [Trap-creates-a-new-scope](./Features/Trap-creates-a-new-scope)
- [Just-does-not-work](./Just-does-not-work)
- [Missing-label](./Missing-label)
- [Module](./Module)
    - [Function-not-found](./Module/Function-not-found)
    - [Function-parent-scope](./Module/Function-parent-scope)
    - [Script-block-scope](./Module/Script-block-scope)
        - [Workaround](./Module/Script-block-scope/Workaround)
    - [Unstable-outer-alias](./Module/Unstable-outer-alias)
- [PowerShell.exe](./PowerShell.exe)
    - [Exit-code-0-with-File](./PowerShell.exe/Exit-code-0-with-File)
    - [Exit-code-0-with-syntax-error](./PowerShell.exe/Exit-code-0-with-syntax-error)
    - [Exit-code-depends](./PowerShell.exe/Exit-code-depends)
    - [Not-current-version](./PowerShell.exe/Not-current-version)
    - [Unexpected-start-location](./PowerShell.exe/Unexpected-start-location)
    - [Version-must-be-first-parameter](./PowerShell.exe/Version-must-be-first-parameter)
- [Region](./Region)
- [Requires](./Requires)
- [Strict-Mode](./Strict-Mode)
    - [Out-String-and-Default-Host](./Strict-Mode/Out-String-and-Default-Host)
    - [Property-Count-on-scalars](./Strict-Mode/Property-Count-on-scalars)
- [Third-error-type](./Third-error-type)

---
