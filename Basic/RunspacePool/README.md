
## Runspace pool memory leaks

Runspace pools may cause memory leaks, at least in tested PowerShell v5, v6.
PowerShell v2 does not have this issue.

The below scripts repeat a similar job infinitely in a loop. Run them and watch
the printed application handle counts and memory sizes. Stop scripts manually
by <kbd>Ctrl+C</kbd> or close their PowerShell consoles.

The script [Test-LoopRunspacePool.ps1](Test-LoopRunspacePool.ps1) uses runspace
pools for `[PowerShell]` sessions. It shows the leaks, i.e. handle and memory
numbers constantly grow over time.

The script [Test-LoopPowerShell.ps1](Test-LoopPowerShell.ps1) uses `[PowerShell]`
sessions without runspace pools. It does not show leaks, i.e. handles and memory
numbers stay within some reasonable range. Thus, avoiding runspace pools is a
workaround for cases where leaks are not acceptable.
