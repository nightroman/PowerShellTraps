
In PowerShell 3.0 several interactive features have issues.
These features work as expected in PowerShell 2.0 and 4.0.

Note that *.test.ps1* covers only tests that do not require user interaction.
Most of test scripts here are interactive and supposed to be invoked manually,
in v3 in order to see issues, in v2 and v4 in order to see it all working fine.

### $Host.EnterNestedPrompt() is ignored

If a script with `$Host.EnterNestedPrompt()` is invoked with *PowerShell.exe*
without the switch `NoExit` then the nested prompt is not entered, invocation
continues.

The workaround is use of the switch `NoExit`.

- *EnterNestedPrompt.ps1* is a script with `$Host.EnterNestedPrompt()`.
- *Test-1.1-EnterNestedPrompt-ignored.ps1* shows the problem with `PowerShell -Command`.
- *Test-1.2-EnterNestedPrompt-ignored.ps1* shows the problem with `PowerShell -File`.
- *Test-1.3-EnterNestedPrompt-workaround.ps1* - workaround `PowerShell -NoExit -Command`.
- *Test-1.4-EnterNestedPrompt-workaround.ps1* - workaround `PowerShell -NoExit -File`.

### Write-Debug prompt - "Suspend" is ignored

When the debug preference (`$DebugPreference`) is set to *Inquire* then
`Write-Debug` shows a debug message and the prompt with several options.
One of the options *Suspend* is supposed to enter the nested prompt.
It is ignored in v3 if `PowerShell.exe` is invoked without `NoExit`.

The workaround is use of the switch `NoExit`.

- *Invoke-Write-Debug-prompt.ps1* sets the debug preference to *Inquire* and calls `Write-Debug`.
- *Test-2.1-debug-Suspend-ignored.ps1* shows the problem with `PowerShell -Command`.
- *Test-2.2-debug-Suspend-ignored.ps1* shows the problem with `PowerShell -File`.
- *Test-2.3-debug-Suspend-workaround.ps1* - workaround `PowerShell -NoExit -Command`.
- *Test-2.4-debug-Suspend-workaround.ps1* - workaround `PowerShell -NoExit -File`.
- Microsoft Connect [812058](https://connect.microsoft.com/PowerShell/Feedback/Details/812058)

### "exit" in Command is ignored if NoExit is specified

This is not exactly an interactive issue but it is somehow related to problems
of PowerShell 3.0 described here. The following perhaps unusual CMD command

```batchfile
    PowerShell.exe -NoExit . "'<path>\Script.ps1'"; exit
```

has useful applications described in details in this [blog post]. In PowerShell
3.0 it is not working as designed because `exit` is ignored and PowerShell does
not exit.

- *Test-3-NoExit-exit.ps1* shows the problem in PowerShell 3.0
- Microsoft Connect [745794](https://connect.microsoft.com/PowerShell/Feedback/Details/745794)

[blog post]: http://nightroman.wordpress.com/2009/11/11/how-to-run-powershell-scripts-from-explorer/
