
The invocation and dot-sourcing operators `&` and `.` are used to invoke
commands and script blocks. In particular they are used to invoke scripts
specified by their full paths. It turns out some odd paths are troublesome.

Although these operators work with literal paths they still can be confused by
wildcard characters in full paths. Note that same characters in relative paths
are not a problem.

The script *test.1.invocation.ps1* creates the script `.\test[\test.ps1` in the
odd directory `test[`. Then this test script is invoked by the operator `&`
using the relative and full paths:

```PowerShell
    # this works and proves that "test[" should not be a problem
    & '.\test[\test.ps1'

    # this fails due to the invalid wildcard
    & "$PSScriptRoot\test[\test.ps1"
```

The script *test.2.dot-sourcing.ps1* shows that the dot-sourcing operator `.`
has the same issues.

**Best workaround**

Ensure your scripts are not in the paths with wildcard characters. Seriously,
if this is the option then this is the best workaround. Note that PowerShell
has other issues in paths with wildcard characters. See for example:

- [Get-Item](../../Cmdlets/Get-Item)
- [Test-Path](../../Cmdlets/Test-Path)
- [Unexpected-start-location](../../PowerShell.exe/Unexpected-start-location)

**True workaround**

Escape wildcard characters in full paths with backticks. Note that this can be
tricky in double quoted strings, backticks should be escaped themselves and
proper number of backticks is not always obvious.

Do not apply this workaround to relative paths, it looks like relative paths
are processed literally. Extra backticks and brackets will produce different
paths, either missing or wrong.
