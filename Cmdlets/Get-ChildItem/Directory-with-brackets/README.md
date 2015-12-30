
### Get-ChildItem -LiteralPath -Recurse gets nothing for a directory with brackets

If `Get-ChildItem -LiteralPath -Recurse` is invoked with a directory with
brackets then it gets nothing in PowerShell v3 and v4. It works properly
in v2 and v5.

The script [Test-1-directory-with-brackets.ps1](Test-1-directory-with-brackets.ps1) shows the issue.

---

- Microsoft Connect [1447261](https://connect.microsoft.com/PowerShell/feedback/details/1447261)
