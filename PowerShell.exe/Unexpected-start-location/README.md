# Unexpected start location

(**Fixed in v6.1.0**)

PowerShell normally sets its initial current location to the current directory
of the caller. As far as it works fine in most cases, a user may expect it to
work always. Tests show that PowerShell fails to do this if a directory name
contains some special characters.

As a result, some code may be invoked with the wrong assumption about the
current location. In PowerShell v2 the unexpected start location is set to
the root (`C:\`). In v3-v6.0.2 it is set to `$PSHOME`.

Scripts show unexpected/expected locations depending on versions:

- [v2.unexpected.start.location.cmd](v2.unexpected.start.location.cmd)
- [v3.unexpected.start.location.cmd](v3.unexpected.start.location.cmd)
- [v6.1.0.expected.start.location.cmd](v6.1.0.expected.start.location.cmd)

---

- [PowerShell/issues/5752](https://github.com/PowerShell/PowerShell/issues/5752)
- Microsoft Connect 514735
