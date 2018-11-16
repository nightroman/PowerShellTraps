
### Remove-Item -LiteralPath fails in a directory with brackets

**Fixed in v6.2.0-preview.2**

If `Remove-Item -LiteralPath` is invoked in a directory with brackets then it
fails. `Remove-Item -Path` works fine.

The script [Test-1-directory-with-brackets.ps1](Test-1-directory-with-brackets.ps1) shows the issue.

---

- Microsoft Connect [1447261](https://connect.microsoft.com/PowerShell/feedback/details/1447261)
