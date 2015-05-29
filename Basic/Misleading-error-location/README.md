
When a script causes an error then the error position message normally points
to the line which causes the error.

There are cases when some combination of factors makes PowerShell to substitute
the original error location with some other location from the call stack. As a
result, it is more difficult to locate the actual source of an error.

The script *Test-1-correct-error-location.ps1* is an example with an expected
error. This error is normal, it tells exactly which line of code fails.

The script *Test-2-misleading-error-location.ps1* is almost the same, just the
attribute `CmdletBinding` is added to a function. The same expected error now
contains misleading location information, it points to some other line in the
call stack. Note that PowerShell 2.0 does not have such an issue.

The script *Test-3-recovering-error-location.ps1* shows that the recoded error
in `$Error` is still correct. Thus, in some cases it is possible to recover
actual error locations by analysing errors stored in `$Error`.

---

- [PowerShellTraps/issues/3](https://github.com/nightroman/PowerShellTraps/issues/3)
