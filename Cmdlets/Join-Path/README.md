
### Join-Path fails if the path drive does not exist

The script *Test-missing-drive.ps1* finds a missing drive and uses it in order
to join paths by the .NET method `Path.Combine()` (works) and by PowerShell
cmdlet `Join-Path` (fails).

### Join-Path with UNC paths: mind the current provider

When `Join-Path` is used with UNC paths then the results may depend on the
current provider. If it is accidentally not *FileSystem* then it may be a
mistake. The script *Test-mind-the-provider.ps1* shows the issue.

---

- Microsoft Connect [779068](https://connect.microsoft.com/PowerShell/feedback/details/779068)
- [Split-Path](../Split-Path)
