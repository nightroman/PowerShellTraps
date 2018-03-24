
## Test-Path -Path with wildcards may miss hidden items

For a hidden item `Y` in a directory `X`, `Test-Path` gets true:

```
PS> Test-Path -Path X\Y
True
```

But if `X` in the argument is replaced with a wildcard `*` then `Test-Path` gets false:

```
PS> Test-Path -Path *\Y
False
```

In other words, if a wildcard `Path` of `Test-Path` is resolved to just hidden
items then `Test-Path` gets false. Unlike `*-Item` cmdlets, `Test-Path` does
not have a switch `Force` in order to change this and find hidden items.

The script [Test-1.ps1](Test-1.ps1) shows the issue.

---

- [PowerShell/issues/6473](https://github.com/PowerShell/PowerShell/issues/6473)
