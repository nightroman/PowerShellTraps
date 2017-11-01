
### v5 and v2: Get-ChildItem -LiteralPath -Recurse ignores -Include

This command (see [Test-1.Path.ps1](Test-1.Path.ps1))

```powershell
    Get-ChildItem -Path $PSHOME -Include *.exe -Recurse
```

gets expected `powershell.exe` and `powershell_ise.exe`.

The same command with `-LiteralPath` instead of `-Path` (see [Test-2.LiteralPath.ps1](Test-2.LiteralPath.ps1))

```powershell
    Get-ChildItem -LiteralPath $PSHOME -Include *.exe -Recurse
```

in PowerShell v5 unexpectedly gets all items in `$PSHOME`.

It looks like `PowerShell.exe -Version 2` shows the same issue.

****

- [PowerShell/issues/5293](https://github.com/PowerShell/PowerShell/issues/5293)
- UserVoice [v5 regression: Get-ChildItem -LiteralPath -Recurse ignores -Include and gets all items](http://windowsserver.uservoice.com/forums/301869-powershell/suggestions/11168994-v5-regression-get-childitem-literalpath-recurse)
- Stack Overflow [Powershell 5 Get-ChildItem LiteralPath doesn't work with Include anymore](http://stackoverflow.com/q/33684178/323582)
