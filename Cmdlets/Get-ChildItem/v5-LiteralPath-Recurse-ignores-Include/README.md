# `Get-ChildItem -LiteralPath -Recurse` ignores `-Include`

(Affected versions: v2, v5 - v6.0.2, **Fixed in v6.1.0**)

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
- Stack Overflow [Powershell 5 Get-ChildItem LiteralPath doesn't work with Include anymore](http://stackoverflow.com/q/33684178/323582)
- windowsserver.uservoice.com/forums/301869-powershell/suggestions/11168994-v5-regression-get-childitem-literalpath-recurse
