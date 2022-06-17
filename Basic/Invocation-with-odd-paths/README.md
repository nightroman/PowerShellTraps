# Invocation with odd paths

[test.1.invocation.ps1]: test.1.invocation.ps1
[test.2.dot-sourcing.ps1]: test.2.dot-sourcing.ps1
[test.3.escaped.ps1]: test.3.escaped.ps1

The invocation and dot-sourcing operators `&` and `.` are used to invoke
commands and script blocks. In particular they are used to invoke scripts
specified by their paths. It turns out some paths are troublesome.

The script [test.1.invocation.ps1] creates the script `.\test[\test.ps1` in the
odd directory `test[`. Then this test script is invoked by the operator `&`
using the relative and full paths:

```powershell
    # this works in v2, v3, v4 and fails in v5
    & '.\test[\test.ps1'

    # this fails due to the invalid wildcard
    & "$PSScriptRoot\test[\test.ps1"
```

The script [test.2.dot-sourcing.ps1] shows that the dot-sourcing operator `.`
has the same issues.

**Best workaround**

Ensure your scripts are not in the paths with wildcard characters. If this is
the option then this is the best workaround. Note that PowerShell has other
issues in paths with wildcard characters. For example:

- [Get-Item](../../Cmdlets/Get-Item)
- [Test-Path](../../Cmdlets/Test-Path)
- [Unexpected-start-location](../../PowerShell.exe/Unexpected-start-location)

**True workaround**

Escape wildcard characters in full paths with backticks. Note that this can be
tricky in double quoted strings, backticks should be escaped themselves and
proper number of backticks is not always obvious.

Consider to avoid relative paths. They are treated differently depending on the
version. Relative paths are processed literally in v2, v3, v4. In v5 they have
the same issue as full paths but use different escaping.

The script [test.3.escaped.ps1] shows how to escape full paths and relative
paths. The latter is needed only in v5, in other versions escaping causes
errors.
