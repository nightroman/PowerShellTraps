## Invoking native apps with error output

Invoking a native app with error output causes a terminating error if the
current error action preference is "Stop".

The script [Test-1.issue.ps1](Test-1.issue.ps1) shows the issue.

**The workaround**

Change the error action preference to "Continue" (default). Other suitable
values are "SilentlyContinue" and "Ignore" (v3+). Ideally, this should be a
temporary change, so that an extra script block may be used. It changes the
error preference locally in its scope and then invokes the app.

The script [Test-2.workaround.ps1](Test-2.workaround.ps1) shows the workaround.
