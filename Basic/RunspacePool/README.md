
## Runspace pool memory leaks with Close() instead of Dispose()

Runspace pools may cause memory leaks, at least in tested PowerShell v5, v6.
PowerShell v2 does not have this issue.

The below scripts repeat a similar job infinitely in a loop. Run them and watch
the printed application handle counts and memory sizes. Stop scripts manually
by <kbd>Ctrl+C</kbd> or close their PowerShell consoles.

The script [Test-LoopRunspacePool.ps1](Test-LoopRunspacePool.ps1) uses runspace
pools for `[PowerShell]` sessions. It calls `Close()` for pools and shows the
leaks, i.e. handle and memory numbers constantly grow over time.

The script [Test-LoopPowerShell.ps1](Test-LoopPowerShell.ps1) uses `[PowerShell]`
sessions without runspace pools. It does not show leaks, i.e. handles and memory
numbers stay within some reasonable range. Thus, avoiding runspace pools is one
way to work around the leaks.

**Workaround**

> In many cases, calling Close() or Dispose() amount to the same thing but not
with a RunspacePool. You need to call Dispose()

Thus, calling `Dispose()` instead of `Close()` for runspace pools solves the issue.
See [Test-LoopRunspacePool.workaround.ps1](Test-LoopRunspacePool.workaround.ps1).

***

- [PowerShell/issues/5746](https://github.com/PowerShell/PowerShell/issues/5746)
