
`Import-Module` writes a non-terminating error if a specified module does not
exist. As a result, if the error action is not `Stop` then a script continues
with the required module not imported. Note that the default error action
preference is `Continue`.

The script [Test-1.unsafe.ps1](Test-1.unsafe.ps1) shows the issue, the script
continues after `Import-Module` errors.

The script [Test-2.safe.ps1](Test-2.safe.ps1) uses the safe approach, it sets
the error action to `Stop`. This can be done either by the parameter or the
preference variable `$ErrorActionPreference`.

***

- Microsoft Connect [506808](https://connect.microsoft.com/PowerShell/feedback/details/506808)
