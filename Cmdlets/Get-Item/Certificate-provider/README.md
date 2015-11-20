
### Get-Item fails to get Cert:

`Get-Item` works with `Function:`, `Variable:`, `Env:`, `HKCU:`, `C:`, etc. But
it gets nothing with `Cert:` in v3+ and fails in v2. See the script
*Test-1.GetItemWithDrive.ps1*.

Similarly, commands

```powershell
    Get-Item .
    Get-Item \
```

work if the current location is set to `C:\` or `HKCU:\` and get nothing if the
location is `Cert:\` in v3+ and fails in v2. See the scripts
*Test-2.GetItemWithDot.ps1* and *Test-3.GetItemWithSlash.ps1*.

---

- Microsoft Connect [67872](https://connect.microsoft.com/PowerShell/feedback/details/67872)
