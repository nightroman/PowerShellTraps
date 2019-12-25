## `Throw` may not terminate

The `help about_throw` tells:

    The Throw keyword causes a terminating error. You can use the Throw keyword
    to stop the processing of a command, function, or script.

This is often true but not always. If, perhaps due to a mistake, the current
error action preference is "SilentlyContinue" or "Ignore" (v3+) then `throw`
does not terminate, unless it is called from a try block.

Scripts

- [Test-1.not.terminating.ps1](Test-1.not.terminating.ps1) shows the issue, `throw` does not terminate.
- [Test-2.terminating.ps1](Test-2.terminating.ps1) shows that `Write-Error -ErrorAction Stop` may be more reliable.
- [Test-3.but.ps1](Test-3.but.ps1) shows that `throw` in the test 1 starts to terminate if it is called from a try block.

***

- [Be Careful With "Throw" Statements](https://community.idera.com/database-tools/powershell/powertips/b/tips/posts/be-careful-with-throw-statements-part-2)
