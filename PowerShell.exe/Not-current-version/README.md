
If a script invokes `PowerShell.exe` with another script and does not specify
the version then a newer PowerShell may be be invoked. This is potentially
unwanted, e.g. if a script to be invoked works differently with a newer
version, the fact yet unknown on development and deployment.

In some cases it may be safer to specify the required version explicitly, for
example for a script designed for v2 to ensure another script is also invoked
by v2:

    PowerShell -Version 2 AnotherScript.ps1

Scripts

- *Not-current-version.ps1* shows how a newer PowerShell version is invoked.
- *.test.ps1* tests the above.
