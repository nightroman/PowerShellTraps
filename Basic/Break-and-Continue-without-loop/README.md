
The statements `break` and `continue` used without a loop is not an error. They
either silently stop a calling script or work as `break` and `continue` for a
existing loop in a parent scope function or script, not necessarily the same.

Note that *.test.ps1* has to call *Test-Break.ps1* and *Test-Continue.ps1*
using `PowerShell.exe`. Otherwise loops of *Invoke-Build.ps1* (the tests
runner) are affected.

Scripts

- *Invoke-Break.ps1* - just `break`.
- *Invoke-Continue.ps1* - just `continue`.
- *Test-Break.ps1* calls *Invoke-Break.ps1* without a loop and gets interrupted.
- *Test-Break2.ps1* calls *Invoke-Break.ps1* from a loop, `break` works for this loop.
- *Test-Continue.ps1* calls *Invoke-Continue.ps1* without a loop and gets interrupted.
- *Test-Continue2.ps1* calls *Invoke-Continue.ps1* from a loop, `continue` works for this loop.

---

- Microsoft Connect [1357730](https://connect.microsoft.com/PowerShell/Feedback/Details/1357730)
- Microsoft Connect [1321210](https://connect.microsoft.com/PowerShell/feedback/details/1321210)
