
### Split-Path with UNC paths: mind the current provider

When the current PowerShell provider is not *FileSystem* `Split-Path` with UNC
paths may produce unexpected results or even fail.

- [Test-1-FileSystem.ps1](Test-1-FileSystem.ps1) - expected result of `Split-Path` with *FileSystem*.
- [Test-2-Function.ps1](Test-2-Function.ps1) - unexpected result of `Split-Path` with *Function*.
- [Test-3.1-Registry.ps1](Test-3.1-Registry.ps1) - `Split-Path` fails with *Registry* due to an invalid path.
- [Test-3.2-Registry.ps1](Test-3.2-Registry.ps1) - `Join-Path` works with *Registry* and the above path.
- [Test-Workaround.ps1](Test-Workaround.ps1) - .NET `Path.GetDirectoryName()` works.

---

- Microsoft Connect [1335123](https://connect.microsoft.com/PowerShell/feedback/details/1335123)
- [Join-Path](../Join-Path)
