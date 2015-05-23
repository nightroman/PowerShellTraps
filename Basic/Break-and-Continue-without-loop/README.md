
Statements `break` and `continue` used without a loop in the current scope is
not an error. They either silently stop a calling script or work as `break` and
`continue` for a parent loop in a calling script.

Note that *.test.ps1* has to call *Test-Break.ps1* and *Test-Continue.ps1*
using `PowerShell.exe`. Otherwise loops of *Invoke-Build.ps1* are affected
(*Invoke-Build.ps1* is used as the test runner).

Scripts

- *Invoke-Break.ps1* - just `break`.
- *Invoke-Continue.ps1* - just `continue`.
- *Test-Break.ps1* calls *Invoke-Break.ps1* without a loop and gets interrupted.
- *Test-Break2.ps1* calls *Invoke-Break.ps1* from a loop, `break` works for this loop.
- *Test-Continue.ps1* calls *Invoke-Continue.ps1* without a loop and gets interrupted.
- *Test-Continue2.ps1* calls *Invoke-Continue.ps1* from a loop, `continue` works for this loop.
