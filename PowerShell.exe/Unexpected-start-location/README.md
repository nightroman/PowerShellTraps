
Test 1 shows that PowerShell sets its start location to the current directory.
As far as it works fine in most cases, a user may expect it to work always.
Test 2 shows that PowerShell fails to do this if a directory name contains
some special characters.

As a result, some code may be invoked with the wrong assumption about the
current location. In PowerShell v2 the unexpected start location is set to
the root (*C:\\*). In v3 it is set to `$PSHOME`.

Scripts

- *Expected.start.location.cmd* - PowerShell starts with its current location set to the current directory.
- *Unexpected.start.location.cmd* - PowerShell starts with its current location set to an unexpected directory.
- *.test.ps1* tests the above results.

---

- Microsoft Connect [514735](https://connect.microsoft.com/PowerShell/Feedback/Details/514735)
