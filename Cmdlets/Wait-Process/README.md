
### Wait-Process fails if a process name is not found

When `Wait-Process` is used with a process name (not a process ID or instance)
then it is supposed to wait for *all* processes with the specified name. Thus,
it is used in order to ensure that none is running. But when this is already
the case, none is running, `Wait-Process` fails with an error:

> Wait-Process : Cannot find a process with the name "X". Verify the process name and call the cmdlet again.

#### Workarounds

The straightforward workaround is to specify `ErrorAction` as *Ignore* (v3+) or
*SilentlyContinue*:

```powershell
    Wait-Process Notepad -ErrorAction SilentlyContinue
```

Yet another workaround which avoids errors is the fake wildcard trick:

```powershell
    Wait-Process [N]otepad
```

The wildcard `[N]otepad` means exactly `Notepad` and yet `Wait-Process` works
because unlike with literal names it is not designed to fail with wildcards
even if processes are not found.

#### Scripts

- *Test-1-fails.ps1* shows that `Wait-Process` fails with *NotRunningProcess*.
- *Test-2-works.ps1* shows the fake wildcard workaround.

---

- Microsoft Connect [449181](https://connect.microsoft.com/PowerShell/feedback/details/449181)
