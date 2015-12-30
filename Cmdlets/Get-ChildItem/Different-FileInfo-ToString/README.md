
### Get-ChildItem gets items converted to strings differently

`Get-ChildItem` returns `FileSystemInfo` objects. Objects representing the same
item may be converted to strings differently. In some cases they are converted
as full paths, in other cases as just names.

For example, this command gets items that converted to strings as full paths:

    Get-ChildItem . -Include *

This command gets the same items but they are converted to strings as names:

    Get-ChildItem .

Scripts

- [Test-1-different-ToString.ps1](Test-1-different-ToString.ps1) shows different conversion to strings of seemingly same items.
- [Test-2-Resolve-Path-fails.ps1](Test-2-Resolve-Path-fails.ps1) shows how `Resolve-Path` fails with items returned from `Get-ChildItem`.

---

- Stack Overflow [question](http://stackoverflow.com/q/2744047/323582)
- Microsoft Connect [556004](https://connect.microsoft.com/PowerShell/Feedback/Details/556004)
- Microsoft Connect [1441999](https://connect.microsoft.com/PowerShell/feedback/details/1441999)
