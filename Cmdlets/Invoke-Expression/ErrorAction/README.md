
### -ErrorAction is ignored in favour of $ErrorActionPreference

The parameter `ErrorAction` of `Invoke-Expression` does not affect processing
of errors in invoked expressions. These errors are processed according to the
current `$ErrorActionPreference`.

Scripts

- [Test-1.Continued.ps1](Test-1.Continued.ps1) uses `-ErrorAction Stop` but the script continues on an error.
- [Test-2.Stopped.ps1](Test-2.Stopped.ps1) uses `-ErrorAction Continue` but the script stops on an error.

***

- Stack Overflow [ErrorAction is ignored in favour of ErrorActionPreference](http://stackoverflow.com/q/35291329/323582)
