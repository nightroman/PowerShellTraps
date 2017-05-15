
### ThrowTerminatingError does not trigger the immediate catch

`$PSCmdlet.ThrowTerminatingError()` may have some advantages over `throw`. But
it has an issue: if it is called from a `try` block then its `catch` is not
called, at least in v5. The `catch` block is called in v2. The `finally`
block is still called.

`Write-Error -ErrorAction Stop` may be used as a workaround.

Scripts

- [Test-1.ThrowTerminatingError.ps1](Test-1.ThrowTerminatingError.ps1) shows the issue.
- [Test-2.Write-Error.ps1](Test-2.Write-Error.ps1) shows the workaround.
