
[TESTS]: ./TESTS.md
[Invoke-PowerShell.ps1]: https://www.powershellgallery.com/packages/Invoke-PowerShell

*PowerShellTraps* is a collection of some PowerShell traps and oddities shown
by demo scripts, workarounds, and automated tests. On invoking scripts change
to their directory. See also [TESTS]. Some scripts require
[Invoke-PowerShell.ps1].

---

## Index

- [Basic](#basic)
- [Class](#class)
- [Clixml](#clixml)
- [Cmdlets](#cmdlets)
- [Module](#module)
- [PowerShell.exe](#powershellexe)

## Basic

<!--Basic-->
- [Operators `-and` and `-or` have the same precedence](Basic/And-and-or-have-same-precedence)
- [Invoking native apps with error output](Basic/App-with-error-output)
- [Automatic variables as parameters or local variables](Basic/Automatic-variables)
- [Break and Continue with not matching label](Basic/Break-and-Continue-with-not-matching-label)
- [Break and Continue without loop](Basic/Break-and-Continue-without-loop)
- [Collection property enumeration](Basic/Collection-property-enumeration)
- [Comparison operators work differently with scalars and collections](Basic/Comparison-operators-with-collections)
- [Compound assignment operators](Basic/Compound-assignment-operators)
- Count-and-Length
    - [Mixed objects](Basic/Count-and-Length/Mixed-objects)
    - [`PSCustomObject` does not have surrogate `Count` and `Length`](Basic/Count-and-Length/PSCustomObject)
    - [`Count` and `Length` of a scalar fail in the strict mode](Basic/Count-and-Length/Strict-Mode)
- [Dictionary Count, Keys, Values may misbehave](Basic/Dictionary-Count-Keys-Values)
- [Different kinds of null](Basic/Different-kinds-of-null)
- [Double quoted strings and sub-expressions with double quotes](Basic/Double-quoted-string)
- DynamicParam
    - [Dynamic switch parameter](Basic/DynamicParam/Dynamic-switch-parameter)
    - [`$MyInvocation.ExpectingInput` is false in `DynamicParam`](Basic/DynamicParam/ExpectingInput-is-false)
- [Enums evaluated to true](Basic/Enums-evaluated-to-true)
- [Errors of unusual type](Basic/Errors-of-unusual-type)
- [FormatEnumerationLimit](Basic/FormatEnumerationLimit)
- [Function invoked like method](Basic/Function-invoked-like-method)
- [Invocation with odd paths](Basic/Invocation-with-odd-paths)
- [LastExitCode](Basic/LastExitCode)
- [Local action preference variables](Basic/Local-ActionPreference)
- [Misleading error location](Basic/Misleading-error-location)
- [Missing ternary operator](Basic/Missing-ternary-operator)
- [Negative number literal argument](Basic/Negative-number-literal-argument)
- [Null converted to empty string](Basic/Null-converted-to-empty-string)
- [Number of returned objects](Basic/Number-of-returned-objects)
- [Operators `-match`, `-notmatch` do not reset `$matches`](Basic/Operators-match-notmatch-and-matches)
- [Counter-intuitive equal precedence of some operators](Basic/Operators-with-equal-precedence)
- [Tricky properties of types implementing IDictionary](Basic/Properties-of-IDictionary)
- [Properties of XML nodes](Basic/Properties-of-XmlNode)
- [Provider specific filters](Basic/Provider-specific-Filter)
- [PSCustomObject](Basic/PSCustomObject)
- [`[ref]` may be unwrapped unexpectedly](Basic/PSReference)
- [Directive `#requires`](Basic/Requires)
- [Runspace pool memory leaks with `Close()`](Basic/RunspacePool)
- [Statements are not expressions](Basic/Statements-are-not-expressions)
- [ErrorRecord formatting may fail in the strict mode in the default host](Basic/Strict-mode-ErrorRecord-formatting)
- [String constructor](Basic/String-constructor)
- [String equality operators](Basic/String-equality-operators)
- [`switch` is a looping construct](Basic/Switch-is-a-looping-construct)
- [Tempting wrong operators](Basic/Tempting-wrong-operators)
- [`Throw` may not terminate](Basic/Throw-may-not-terminate)
- ThrowTerminatingError
    - [`ThrowTerminatingError` does not trigger the immediate catch](Basic/ThrowTerminatingError/Catch-is-not-called)
    - [`ThrowTerminatingError` produces not true terminating errors](Basic/ThrowTerminatingError/Not-true-terminating)
- [Too simple function names](Basic/Too-simple-function-names)
- [`trap` creates a new scope](Basic/Trap-creates-a-new-scope)
- [`trap` with `continue`](Basic/Trap-with-continue)
- [`trap` with no `break` or `continue`](Basic/Trap-with-no-break-or-continue)
- [`try` and `trap` catch terminating errors](Basic/Try-and-trap-catch-terminating-errors)
- [Unexpected output](Basic/Unexpected-output)
- [Unexpected overloaded method](Basic/Unexpected-overloaded-method)
- [Unrolled collections](Basic/Unrolled-collections)
- [v5 method `new()`](Basic/v5-Method-New)
- [`ValidateScript` and cryptic error messages](Basic/ValidateScript-attribute)
- [ValueFromPipeline used for several parameters](Basic/ValueFromPipeline)
- [Parameters with ValueFromRemainingArguments](Basic/ValueFromRemainingArguments)
- [When `process` block is called](Basic/When-Process-block-is-called)
- [`WildcardPattern.Escape()` does not escape some backticks](Basic/WildcardPattern)
<!--Basic-->

## Class

<!--Class-->
- [Attribute with later defined type parameter](Class/Attribute-with-later-defined-type-parameter)
- [Cannot derive a class from another defined later](Class/Cannot-derive-from-defined-later)
- [Cannot derive from dot sourced](Class/Cannot-derive-from-dot-sourced)
- [Identical script blocks issue](Class/Identical-scriptblocks-issue)
- [Methods do not see implicitly created variables](Class/Method-cannot-see-created-variable)
- [Parser fails on custom type](Class/Parser-fails-on-custom-type)
<!--Class-->

## Clixml

<!--Clixml-->
- [Cannot write to hidden files](Clixml/Cannot-write-to-hidden-files)
- [Hashtable case sensitivity](Clixml/Hashtable-case-sensitivity)
- [`OrderedDictionary` becomes `Hashtable`](Clixml/OrderedDictionary-becomes-Hashtable)
- [`ScriptBlock` becomes `String`](Clixml/ScriptBlock-becomes-String)
- [No `LiteralPath` in v2](Clixml/v2-no-LiteralPath)
<!--Clixml-->

## Cmdlets

<!--Cmdlets-->
- ConvertFrom-Csv
    - [`ConvertFrom-Csv` has undocumented partial comment support](Cmdlets/ConvertFrom-Csv/Partial-comment-support)
- ConvertFrom-Json
    - [`ConvertFrom-Json` returns an array not unrolled](Cmdlets/ConvertFrom-Json/Not-unrolled-result)
    - [`ConvertFrom-Json` pipeline input](Cmdlets/ConvertFrom-Json/Piping-content)
    - [`ConvertFrom-Json` long integers in v6](Cmdlets/ConvertFrom-Json/v6-long-integers)
- ConvertTo-Json
    - [`ConvertTo-Json` Array as PSObject](Cmdlets/ConvertTo-Json/Array-as-PSObject)
    - [`ConvertTo-Json` without `Compress` may change data](Cmdlets/ConvertTo-Json/v3-Without-Compress)
- Copy-Item
    - [`Copy-Item` - `Exclude` is ignored with `Recurse`](Cmdlets/Copy-Item/Exclude-and-Recurse)
    - [`Copy-Item` inconsistent destination directory](Cmdlets/Copy-Item/Inconsistent-destination)
- [`ForEach-Object`](Cmdlets/ForEach-Object)
- Get-ChildItem
    - [`Get-ChildItem` gets items converted to strings differently](Cmdlets/Get-ChildItem/Different-FileInfo-ToString)
    - [`Get-ChildItem` wildcard-path fails in a directory with backticks](Cmdlets/Get-ChildItem/Directory-with-backticks)
    - [`Get-ChildItem -LiteralPath -Recurse` gets nothing for a directory with brackets](Cmdlets/Get-ChildItem/Directory-with-brackets)
    - [`Get-ChildItem -Recurse` and missing `-Path` unexpected search](Cmdlets/Get-ChildItem/Missing-path-and-Recurse)
    - [`Get-ChildItem -LiteralPath -Recurse` ignores `-Include`](Cmdlets/Get-ChildItem/v5-LiteralPath-Recurse-ignores-Include)
- Get-Content
    - [`Get-Content` with `OutVariable` and `ReadCount`](Cmdlets/Get-Content/OutVariable-and-ReadCount)
- Get-Event
    - [`Get-Event` erratic failures in v2-4](Cmdlets/Get-Event/v2-4-Erratic-failure)
- Get-Item
    - [`Get-Item` fails to get `Cert:`](Cmdlets/Get-Item/Certificate-provider)
    - [`Get-Item` works incorrectly in some locations](Cmdlets/Get-Item/Directory-with-brackets)
- Get-ItemPropertyValue
    - [`Get-ItemPropertyValue` ignores `ErrorAction`](Cmdlets/Get-ItemPropertyValue/ErrorAction-ignored)
- [`Get-Unique` oddities](Cmdlets/Get-Unique)
- Get-WmiObject
    - [`Get-WmiObject` - amended WMI data may fail in the strict mode `Latest`](Cmdlets/Get-WmiObject/Strict-mode-Latest)
- Group-Object
    - [`Group-Object -AsHashTable` and custom expressions](Cmdlets/Group-Object/AsHashTable)
    - [`Group-Object` and properties made by expressions with no values](Cmdlets/Group-Object/Expression-with-no-value)
- [`Import-Csv` may trim leading spaces](Cmdlets/Import-Csv)
- Import-Module
    - [`Import-Module` non-terminating error](Cmdlets/Import-Module/Non-terminating-error)
- Invoke-Expression
    - [`Invoke-Expression` `ErrorAction` is ignored in favour of `$ErrorActionPreference`](Cmdlets/Invoke-Expression/ErrorAction)
- Invoke-RestMethod
    - [`Invoke-RestMethod` returns an array not unrolled](Cmdlets/Invoke-RestMethod/Not-unrolled-result)
- [`Join-Path` fails if the path drive does not exist](Cmdlets/Join-Path)
- Read-Host
    - [v5 output before `Read-Host`](Cmdlets/Read-Host/v5-Output-before-Read-Host)
- Remove-Item
    - [`Remove-Item -LiteralPath` fails in a directory with brackets](Cmdlets/Remove-Item/Directory-with-brackets)
    - [`Remove-Item` may ignore items specified by `Exclude`](Cmdlets/Remove-Item/Exclude-may-be-ignored)
- [`Remove-ItemProperty -Confirm` fails on 'No' (Registry)](Cmdlets/Remove-ItemProperty)
- Rename-Item
    - [`Rename-Item` has no `LiteralPath` in v2](Cmdlets/Rename-Item/v2-no-LiteralPath)
- Resolve-Path
    - [`Resolve-Path -Path` with wildcards misses hidden items](Cmdlets/Resolve-Path/Wildcards-miss-hidden-items)
- Select-Xml
    - [`Select-Xml -Content` does not support input as stream](Cmdlets/Select-Xml/Content-as-stream)
- Set-Content
    - [`Set-Content` fails in a directory with brackets](Cmdlets/Set-Content/Directory-with-brackets)
    - [`Set-Content` unexpected output location](Cmdlets/Set-Content/Unexpected-output-location)
- [`Split-Path` with UNC paths: mind the current provider](Cmdlets/Split-Path)
- [`Start-Process`](Cmdlets/Start-Process)
- Test-Path
    - [`Test-Path` oddities](Cmdlets/Test-Path/Incorrect-in-odd-location)
    - [`Test-Path -Path` with wildcards misses hidden items](Cmdlets/Test-Path/Wildcards-miss-hidden-items)
- [`Wait-Process` fails if a process name is not found](Cmdlets/Wait-Process)
- [`Where-Object`](Cmdlets/Where-Object)
- [`Write-Debug`](Cmdlets/Write-Debug)
- [`Write-Progress`](Cmdlets/Write-Progress)
<!--Cmdlets-->

## Module

<!--Module-->
- [Conflict with aliases](Module/Conflict-with-aliases)
- [Function parent scope](Module/Function-parent-scope)
- [Not found function](Module/Not-found-function)
- [Not found function (part 2)](Module/Not-found-function-2)
- [Not found variable](Module/Not-found-variable)
- [Script block scope](Module/Script-block-scope)
- [How to set a variable in the caller scope](Module/Set-variable-in-caller-scope)
- [Strict mode is not propagated](Module/Strict-mode-is-not-propagated)
- [v2 does not support the manifest field `RootModule`](Module/v2-Manifest-RootModule-is-not-supported)
<!--Module-->

## PowerShell.exe

<!--PowerShell.exe-->
- [Exit code 0 with Command syntax error](PowerShell.exe/Exit-code-0-with-Command-syntax-error)
- [Exit code 0 with File script error](PowerShell.exe/Exit-code-0-with-File-script-error)
- [Exit code 5 with File, 1 with Command](PowerShell.exe/Exit-code-5-with-File-1-with-Command)
- [Exit code depends](PowerShell.exe/Exit-code-depends)
- [Global and script scope](PowerShell.exe/Global-and-script-scope)
- [Not current version](PowerShell.exe/Not-current-version)
- [Different positional parameters in powershell and pwsh](PowerShell.exe/Positional-Command-File)
- [Switch parameter with value](PowerShell.exe/Switch-parameter-with-value)
- [Unexpected start location](PowerShell.exe/Unexpected-start-location)
- [v3 interactive issues](PowerShell.exe/v3-Interactive-issues)
- [Parameter `Version` must be the first.](PowerShell.exe/Version-parameter)
- [`Version` and scriptblock host problem](PowerShell.exe/Version-scriptblock-host-problem)
<!--PowerShell.exe-->

---
