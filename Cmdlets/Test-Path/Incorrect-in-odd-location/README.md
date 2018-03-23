
## Test-Path works incorrectly in some locations

`Test-Path` and `Test-Path -LiteralPath` may work incorrectly with relative
paths if the current location path is "odd".

The script [Current.directory.with.odd.name.ps1](Current.directory.with.odd.name.ps1) creates directories with odd
names, sets the current location to them, and tests an existing item using
`Test-Path`. Results are unexpected.

See also

- Similar [Get-Item](../../Get-Item/Directory-with-brackets) issues
- Microsoft Connect [389828](https://connect.microsoft.com/PowerShell/Feedback/Details/389828)

## Test-Path gets true for a space

This code

```powershell
Test-Path ' '
```

always gets true.

- [PowerShell/issues/5717](https://github.com/PowerShell/PowerShell/issues/5717)
