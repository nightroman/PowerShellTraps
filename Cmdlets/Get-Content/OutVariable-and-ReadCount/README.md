# `Get-Content` with `OutVariable` and `ReadCount`

Using `Get-Content` with `OutVariable` and `ReadCount` may produce an
unexpected nested array in the result variable. Using or not using the
switch `Raw` makes no difference.

The workaround is not using `ReadCount` together with `OutVariable`.

**Scripts**

- [Test-1.ps1](Test-1.ps1) shows the issue without `Raw`
- [Test-2-Raw.ps1](Test-2-Raw.ps1) shows the same issue with `Raw`

---

- [PowerShellTraps/issues/19](https://github.com/nightroman/PowerShellTraps/issues/19)
