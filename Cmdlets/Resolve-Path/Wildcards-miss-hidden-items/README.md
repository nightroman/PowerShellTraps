
## Resolve-Path -Path with wildcards misses hidden items

`Resolve-Path` treats hidden files and folders not like `*-Items` cmdlets do:

- With literal paths, it finds items regardless of their hidden attribute.
- With wildcards, it resolves only not hidden items.

Unlike `*-Item` cmdlets, `Resolve-Path` does not have the switch `Force` in order
to control the treatment of hidden items.

See the example script [Test-1.ps1](Test-1.ps1).

---

- [Test-Path/Wildcards-miss-hidden-items](../../Test-Path/Wildcards-miss-hidden-items)
- [PowerShell/issues/6473](https://github.com/PowerShell/PowerShell/issues/6473)
