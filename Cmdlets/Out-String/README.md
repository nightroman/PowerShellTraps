
### Out-String fails in the strict mode with the default host

The script *Out-String-works.ps1* creates an instance of `[PowerShell]` in
order to invoke some code in a separate runspace. The code throws a test error
in the `try` block and in the `catch` block outputs formatted information about
the error. It uses `Out-String` for formatting and works fine.

The script *Out-String-fails.ps1* invokes the same code in a separate runspace
with one more line which enables the strict mode

    Set-StrictMode -Version 2

As a result, `Out-String` fails. It looks like some internal code is not well
designed to work properly in the strict mode with some hosts. The code uses
`$host.UI.RawUI.BufferSize.Width` but this property does not exist.

---

- Microsoft Connect [708182](https://connect.microsoft.com/PowerShell/Feedback/Details/708182)
