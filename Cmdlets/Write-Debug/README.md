
When `Write-Debug` is used in a command (function or script) with cmdlet
binding and the command is invoked with the switch `Debug`, `Write-Debug`
writes the debug message and prompts:

    DEBUG: ...
    Confirm
    Continue with this operation?
    [Y] Yes  [A] Yes to All  [H] Halt Command  [S] Suspend  [?] Help (default is "Y"):

It turns out *Yes To All* works like *Yes*, that is it does not affect other
`Write-Debug` statements or the same statement repeated in a loop or pipeline,
they will trigger the prompt again each time.

Unlike `Write-Debug`, the method `$PSCmdlet.WriteDebug()` works as expected,
*Yes To All* makes subsequent calls of `WriteDebug()` to work without prompts.

The scripts are interactive and not covered by automated tests:

- [Test-1-Yes-to-All-ignored.ps1](Test-1-Yes-to-All-ignored.ps1) shows the issue in a pipeline.
- [Test-2-Yes-to-All-ignored.ps1](Test-2-Yes-to-All-ignored.ps1) shows the issue in a loop.
- [Test-3-Workaround.ps1](Test-3-Workaround.ps1) uses `$PSCmdlet.WriteDebug()`.

---

- Microsoft Connect [1441324](https://connect.microsoft.com/PowerShell/feedback/details/1441324)
