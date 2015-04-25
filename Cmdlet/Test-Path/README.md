
### Test-Path works incorrectly in some locations

`Test-Path` and `Test-Path -LiteralPath` may work incorrectly with relative
paths if the current location path is "odd".

The script *Current.directory.with.odd.name.ps1* creates directories with odd
names, sets the current location to them, and tests an existing item using
`Test-Path`. Results are unexpected.

---

- Microsoft Connect [389828](https://connect.microsoft.com/PowerShell/Feedback/Details/389828)
