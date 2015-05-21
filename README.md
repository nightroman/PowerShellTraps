
PowerShell is a great tool. But it is not perfect. This is not a problem if one
knows the pitfalls and ways to avoid them. *PowerShellTraps* is a collection of
some traps and oddities shown by demo scripts and covered by automated tests.
One of the goals is to test future PowerShell versions and see what changes.

For simplicity some demo scripts require that the current PowerShell location
is set to their directory. But this is not needed for automated tests, they
take care of proper current locations themselves. See also [TESTS].

Contributions are welcome, see [CONTRIBUTING].

[CONTRIBUTING]: ./CONTRIBUTING.md
[TESTS]: ./TESTS.md

---

<!--Generated-->
- [Basic](./Basic)
    - [And-and-or-have-same-precedence](./Basic/And-and-or-have-same-precedence)
    - [Break-and-Continue-with-not-matching-label](./Basic/Break-and-Continue-with-not-matching-label)
    - [Break-and-Continue-without-loop](./Basic/Break-and-Continue-without-loop)
    - [Cannot-pipe-some-expressions](./Basic/Cannot-pipe-some-expressions)
    - [Compound-equality-operators](./Basic/Compound-equality-operators)
    - [Count-and-Length-in-Strict-Mode](./Basic/Count-and-Length-in-Strict-Mode)
    - [Count-and-Length-of-mixed-objects](./Basic/Count-and-Length-of-mixed-objects)
    - [Dynamic-switch-parameter](./Basic/Dynamic-switch-parameter)
    - [Enums-are-always-evaluated-to-true](./Basic/Enums-are-always-evaluated-to-true)
    - [Errors-of-unusual-type](./Basic/Errors-of-unusual-type)
    - [Extra-properties-of-IDictionary](./Basic/Extra-properties-of-IDictionary)
    - [Function-invoked-like-method](./Basic/Function-invoked-like-method)
    - [Logical-operators-with-collections](./Basic/Logical-operators-with-collections)
    - [Null-converted-to-empty-string](./Basic/Null-converted-to-empty-string)
    - [Number-of-returned-objects](./Basic/Number-of-returned-objects)
    - [Requires](./Basic/Requires)
    - [Switch-is-a-looping-construct](./Basic/Switch-is-a-looping-construct)
    - [Tempting-wrong-operators](./Basic/Tempting-wrong-operators)
    - [Too-simple-function-names](./Basic/Too-simple-function-names)
    - [Trap-creates-a-new-scope](./Basic/Trap-creates-a-new-scope)
    - [Trap-with-continue](./Basic/Trap-with-continue)
    - [Trap-with-no-break-or-continue](./Basic/Trap-with-no-break-or-continue)
    - [Try-and-trap-catch-terminating-errors](./Basic/Try-and-trap-catch-terminating-errors)
    - [Unexpected-output](./Basic/Unexpected-output)
    - [Unrolled-collections](./Basic/Unrolled-collections)
    - [ValidateScript-attribute](./Basic/ValidateScript-attribute)
- [Clixml](./Clixml)
    - [Hashtable-case-sensitivity](./Clixml/Hashtable-case-sensitivity)
    - [OrderedDictionary-becomes-Hashtable](./Clixml/OrderedDictionary-becomes-Hashtable)
    - [v2-no-LiteralPath](./Clixml/v2-no-LiteralPath)
- [Cmdlets](./Cmdlets)
    - [ConvertTo-Json](./Cmdlets/ConvertTo-Json)
    - [ForEach-Object](./Cmdlets/ForEach-Object)
    - [Get-ChildItem](./Cmdlets/Get-ChildItem)
        - [Different-FileInfo-ToString](./Cmdlets/Get-ChildItem/Different-FileInfo-ToString)
        - [Missing-path-and-Recurse](./Cmdlets/Get-ChildItem/Missing-path-and-Recurse)
    - [Get-Item](./Cmdlets/Get-Item)
    - [Get-Unique](./Cmdlets/Get-Unique)
    - [Import-Csv](./Cmdlets/Import-Csv)
    - [Join-Path](./Cmdlets/Join-Path)
    - [Out-String](./Cmdlets/Out-String)
    - [Set-Content](./Cmdlets/Set-Content)
    - [Split-Path](./Cmdlets/Split-Path)
    - [Test-Path](./Cmdlets/Test-Path)
    - [Where-Object](./Cmdlets/Where-Object)
    - [Write-Progress](./Cmdlets/Write-Progress)
- [Module](./Module)
    - [Function-not-found](./Module/Function-not-found)
    - [Function-parent-scope](./Module/Function-parent-scope)
    - [Script-block-scope](./Module/Script-block-scope)
    - [Unstable-outer-alias](./Module/Unstable-outer-alias)
- [PowerShell.exe](./PowerShell.exe)
    - [Exit-code-0-with-File-and-error](./PowerShell.exe/Exit-code-0-with-File-and-error)
    - [Exit-code-0-with-syntax-error](./PowerShell.exe/Exit-code-0-with-syntax-error)
    - [Exit-code-5-with-File-1-with-Command](./PowerShell.exe/Exit-code-5-with-File-1-with-Command)
    - [Exit-code-depends](./PowerShell.exe/Exit-code-depends)
    - [Not-current-version](./PowerShell.exe/Not-current-version)
    - [Unexpected-start-location](./PowerShell.exe/Unexpected-start-location)
    - [Version-must-be-first-parameter](./PowerShell.exe/Version-must-be-first-parameter)

---
