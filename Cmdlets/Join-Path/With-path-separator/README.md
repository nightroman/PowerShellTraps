# `Join-Path` with path separator

Use case: some applications require trailing path separators for input directory paths.

`Join-Path` with `\` or `/` as the second argument may be used in order to
ensure this requirement in Windows PowerShell. In PowerShell Core results
may be unexpected.

The script [Test-1.ps1](Test-1.ps1) shows some cases with differences.

---

- [PowerShell/issues/24193](https://github.com/PowerShell/PowerShell/issues/24193)
- [PowerShellTraps/issues/20](https://github.com/nightroman/PowerShellTraps/issues/20)
