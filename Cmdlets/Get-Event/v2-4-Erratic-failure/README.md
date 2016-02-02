
In PowerShell v2, v3, v4 on many incoming events `Get-Event` may fail with an
internal exception. In PowerShell v5 this issue seems to be fixed.

Scripts

- [events.ps1](events.ps1) frequently changes a file and causes many events
- [handle.ps1](handle.ps1) subscribes to events and periodically calls `Get-Event`
- [Test-1.ps1](Test-1.ps1) starts the above scripts simultaneously, `Get-Event` eventually fails.
