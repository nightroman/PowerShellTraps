
### ThrowTerminatingError produces not true terminating errors

Unlike `throw` or `Write-Error -ErrorAction Stop`, `$PSCmdlet.ThrowTerminatingError`
produces not true terminating errors. They terminate the current command but
they do not terminate callers unless they use `try` blocks or
`$ErrorActionPreference = 'Stop'`.

`help about_preference_variables` says

    $ErrorActionPreference

          Neither $ErrorActionPreference nor the ErrorAction common parameter
          affect how Windows PowerShell responds to terminating errors (those
          that stop cmdlet processing).

As far as tests show that `$ErrorActionPreference` affects how PowerShell
responds to errors created by `ThrowTerminatingError`, it looks like this
help confirms that `ThrowTerminatingError` is not true terminating.

Scripts

- [Test-1.1.ThrowTerminatingError.ps1](Test-1.1.ThrowTerminatingError.ps1) calls `ThrowTerminatingError`.
- [Test-1.2.ThrowTerminatingError.ps1](Test-1.2.ThrowTerminatingError.ps1) calls the above and the script *continues*.
- [Test-2.1.Throw.ps1](Test-2.1.Throw.ps1) calls `throw`.
- [Test-2.2.Throw.ps1](Test-2.2.Throw.ps1) calls the above and the script *terminates*.
- [Test-3.1.Write-Error.ps1](Test-3.1.Write-Error.ps1) calls `Write-Error -ErrorAction Stop`.
- [Test-3.2.Write-Error.ps1](Test-3.2.Write-Error.ps1) calls the above and the script *terminates*.

---

- [ThrowTerminatingError() errors are not true terminating errors](http://stackoverflow.com/q/38465699/323582)
