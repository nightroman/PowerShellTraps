
In PowerShell v5 output written by some commands preceding `Read-Host` may be
not shown until `Read-Host` completes. The same is true for the function
`pause` which uses `Read-Host`.

Example ([Test-1.issue.ps1](Test-1.issue.ps1)):

````powershell
    Get-Process | Select-Object Name, WS
    Read-Host Pause
````

In v5 `Read-Host` prompt *Pause* is shown first.

[Test-2.workaround.ps1](Test-2.workaround.ps1) shows a workaround.
Use `Out-Host` to make the output shown before `Read-Host`:

````powershell
    Get-Process | Select-Object Name, WS | Out-Host
    Read-Host Pause
````

Other commands dealing with output may help, too: `Out-String`, `Format-Table`.

***

- Microsoft Connect [1635172](https://connect.microsoft.com/PowerShell/Feedback/Details/1635172)
- Stack Overflow [Unable to Pause or Sleep after Select-Object in PowerShell](http://stackoverflow.com/q/34835327/323582)
