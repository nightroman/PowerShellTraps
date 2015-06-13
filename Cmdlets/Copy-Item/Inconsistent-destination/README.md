
### Copy-Item: inconsistent destination directory

If a directory 1 is copied by `Copy-Item` then the result depends on existence
of the destination directory 2.

- If 2 does not exist then `Copy-Item` works as expected, the destination 2 is
  created and files from 1 are copied to 2.
- If 2 exists, for example the same command is called again, then `Copy-Item`
  works as if the destination is 2/n1 where n1 is the name of directory 1.

#### Workaround

The following workaround is suggested at Connect:

```powershell
    mkdir $destination -Force
    Copy-Item $source\* $destination -Recurse -Force
```

#### Scripts

- *Test-1-inconsistent-destination.ps1* shows different destinations on the first and second copies.
- *Test-2-workaround.ps1* shows the workaround with consistent destination.

---

- Microsoft Connect [809855](https://connect.microsoft.com/PowerShell/feedback/details/809855)
