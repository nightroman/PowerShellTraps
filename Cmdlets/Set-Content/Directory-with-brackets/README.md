
### Set-Content fails in a directory with brackets

If `Set-Content -Path` is invoked in a directory with brackets then it fails.

If `Set-Content -LiteralPath` is invoked in a directory with brackets then it
works fine in v3+ and silently fails in PowerShell v2.

The script *Test-1-directory-with-brackets.ps1* shows the issue.

---

- Microsoft Connect [436533](https://connect.microsoft.com/PowerShell/feedback/details/436533)
