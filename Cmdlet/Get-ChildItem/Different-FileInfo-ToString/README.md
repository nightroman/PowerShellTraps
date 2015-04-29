
### Get-ChildItem gets items converted to strings differently

`Get-ChildItem` returns `FileSystemInfo` objects. Objects representing the same
item may be converted to strings differently. In some cases they are converted
as full paths, in other cases as just names.

For example, this command gets items that converted to strings as full paths:

    Get-ChildItem . -Include *

This command gets the same items but they are converted to strings as names:

    Get-ChildItem .

Scripts

- *different.FileInfo.ToString.ps1* show different conversion to strings of seemingly same items.
- *.test.ps1* tests the above.

---

- Stack Overflow [question](http://stackoverflow.com/q/2744047/323582)
- Microsoft Connect [556004](https://connect.microsoft.com/PowerShell/Feedback/Details/556004)
