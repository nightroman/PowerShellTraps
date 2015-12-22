
### v5: Get-ChildItem -LiteralPath -Recurse ignores -Include

This command (see *Test-1.Path.ps1*)

```powershell
    Get-ChildItem -Path $PSHOME -Include *.exe -Recurse
```

gets expected `powershell.exe` and `powershell_ise.exe`.

The same command with `-LiteralPath` instead of `-Path` (see *Test-2.LiteralPath.ps1*)

```powershell
    Get-ChildItem -LiteralPath $PSHOME -Include *.exe -Recurse
```

in PowerShell v5 unexpectedly gets all items in `$PSHOME`.

****

- [Windows Server UserVoice](http://windowsserver.uservoice.com/forums/301869-powershell/suggestions/11168994-v5-regression-get-childitem-literalpath-recurse)
- [Stack Overflow](http://stackoverflow.com/q/33684178/323582)
