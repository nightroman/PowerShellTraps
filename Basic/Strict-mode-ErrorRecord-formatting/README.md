## ErrorRecord formatting may fail in the strict mode in the default host

- **Fixed in v6-RC**

Some internal code of `ErrorRecord` formatting is not well designed for the
strict mode with some hosts. The code uses `$host.UI.RawUI.BufferSize.Width`
but this property may not exist, for example in the default host.

The scripts below create an instance of `[PowerShell]` and invoke some code in
its runspace. The code throws an error and in the `catch` block tries to output
formatted information about the error. The formatting fails.

- [Test-1.Out-String.ps1](Test-1.Out-String.ps1)
- [Test-2.Format-List.ps1](Test-2.Format-List.ps1)

These scripts use `Out-String` and `Format-List`. Some other commands that
trigger formatting are `Out-File`, `Format-Custom`, `Format-Table`, `Format-Wide`.

The scripts work fine if this line is removed

```powershell
Set-StrictMode -Version 2
```

If the strict mode is required and a script is designed to work in any host
then standard formatting of errors should be avoided.

The script [Test-3.manual.formatting.ps1](Test-3.manual.formatting.ps1) shows
how to manually format an error in a way similar to `Out-String`.

---

- [PowerShell/issues/11371](https://github.com/PowerShell/PowerShell/issues/11371)
- Discussion of [PowerShellPracticeAndStyle/issues/51](https://github.com/PoshCode/PowerShellPracticeAndStyle/issues/51)
- Microsoft Connect 708182
