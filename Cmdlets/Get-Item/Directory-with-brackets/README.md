
### Get-Item works incorrectly in some locations

`Get-Item` and `Get-Item -LiteralPath` may work incorrectly with relative
paths if the current location path is "odd".

The script [Current.directory.with.odd.name.ps1](Current.directory.with.odd.name.ps1) creates directories with odd
names, sets the current location to them, and tests an existing item using
`Get-Item`. Results are unexpected.

See also

- Similar [Test-Path](../../Test-Path) issues
- Microsoft Connect [389828](https://connect.microsoft.com/PowerShell/Feedback/Details/389828)
