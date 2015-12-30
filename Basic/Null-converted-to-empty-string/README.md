
When null is passed to a .NET method as a string parameter then null is
converted to an empty string.

In PowerShell 2.0 it is simply not possible to pass null as null to such
methods from scripts (without adding .NET helper classes to work around).

In PowerShell 3.0 it is possible with a special value used instead of null:
`[System.Management.Automation.Language.NullString]::Value`. But this
workaround does not eliminate the problem.

Scripts

- [MethodWithStringParameter.ps1](MethodWithStringParameter.ps1) adds a class with a method to be tested.
- [Test-Problem.ps1](Test-Problem.ps1) shows the problem.
- [Test-Workaround.ps1](Test-Workaround.ps1) shows the workaround.

---

- Microsoft Connect [307821](https://connect.microsoft.com/PowerShell/feedback/details/307821)
