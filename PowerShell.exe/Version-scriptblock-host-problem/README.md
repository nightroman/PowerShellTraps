
When `PowerShell.exe` is called from PowerShell then it is possible to specify
the parameter `Command` as a script block. But if the parameter `Version` is
also specified then in some hosts this combination fails with a confusing
error:

> The term '-Version' is not recognized as the name of a cmdlet, function,
script file, or operable program.

For example, this command works in any host

```powershell
    PowerShell {...}
```

This command works in *ConsoleHost* but fails in *ISE*, *DefaultHost*, and some others including PowerShell jobs

```powershell
    PowerShell -Version 2 {...}
```

Scripts

- *Test.1.works.in.any.host.ps1* - `PowerShell {...}` works in any host.
- *Test.2.works.in.ConsoleHost.ps1* - with `Version` it works in *ConsoleHost* but fails in others.
- *Test.3.fails.in.DefaultHost.ps1* shows that `PowerShell -Version 2 {...}` fails in *DefaultHost*.
- *Test.4.fails.in.PowerShell.job.ps1* shows that `PowerShell -Version 2 {...}` fails in a PowerShell job.
