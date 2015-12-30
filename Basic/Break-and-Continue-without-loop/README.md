
The statements `break` and `continue` used without loops are not errors. They
work for a loop in a parent scope, even if it is not in the same script. If a
loop does not exist then the invocation silently stops.

Note that [.test.ps1](.test.ps1) has to call [Test-Break.ps1](Test-Break.ps1) and [Test-Continue.ps1](Test-Continue.ps1)
using `PowerShell.exe`. Otherwise loops of `Invoke-Build.ps1` (the tests
runner) are affected.

Scripts

- [Invoke-Break.ps1](Invoke-Break.ps1) - just `break`.
- [Invoke-Continue.ps1](Invoke-Continue.ps1) - just `continue`.
- [Test-Break.ps1](Test-Break.ps1) calls [Invoke-Break.ps1](Invoke-Break.ps1) without a loop and gets interrupted.
- [Test-Break2.ps1](Test-Break2.ps1) calls [Invoke-Break.ps1](Invoke-Break.ps1) from a loop, `break` works for this loop.
- [Test-Continue.ps1](Test-Continue.ps1) calls [Invoke-Continue.ps1](Invoke-Continue.ps1) without a loop and gets interrupted.
- [Test-Continue2.ps1](Test-Continue2.ps1) calls [Invoke-Continue.ps1](Invoke-Continue.ps1) from a loop, `continue` works for this loop.

---

- Microsoft Connect [1357730](https://connect.microsoft.com/PowerShell/Feedback/Details/1357730)
- Microsoft Connect [1321210](https://connect.microsoft.com/PowerShell/feedback/details/1321210)
