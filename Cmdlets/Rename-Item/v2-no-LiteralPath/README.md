
The parameter `LiteralPath` of `Rename-Item` is missing in PowerShell v2.
The current help does not mention this fact, hence the trap.

Thus, in scripts designed for v2 only `Path` can be used. It may be tricky
to rename files with special characters in their names, e.g. brackets. The
special characters should be escaped.

Fortunately, `Move-Item` may be used instead for renaming.
Unlike `Rename-Item`, it provides `LiteralPath` in v2.

Scripts

- [Test-1.Rename-Item.LiteralPath.ps1](Test-1.Rename-Item.LiteralPath.ps1)
- [Test-2.Move-Item.LiteralPath.ps1](Test-2.Move-Item.LiteralPath.ps1)
