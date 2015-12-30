
**Fixed in PowerShell v5**

If a script has a syntax error or throws an error then PowerShell exit code is

- 0 (success) when a script is specified by the parameter `File`
- 1 (failure) when a script is specified by the parameter `Command`

Consider to use `Command` when an exit code is essential. Note that `Command`
has its own issues. It is difficult to compose if a script path or arguments
contain special characters. Syntax errors in a command cause the exit code 0,
see [Exit-code-0-with-Command-syntax-error](../Exit-code-0-with-Command-syntax-error).
Also, `Command` may not return the actual exit code of a script,
see [Exit-code-5-with-File-1-with-Command](../Exit-code-5-with-File-1-with-Command).

Scripts

- [Error-Syntax.ps1](Error-Syntax.ps1) has a syntax error.
- [Error-Throw.ps1](Error-Throw.ps1) just throws an error.
- [Test-Command-syntax.ps1](Test-Command-syntax.ps1) invokes `PowerShell -Command .\Error-Syntax.ps1` and shows the exit code 1.
- [Test-Command-throw.ps1](Test-Command-throw.ps1) invokes `PowerShell -Command .\Error-Throw.ps1` and shows the exit code 1.
- [Test-File-syntax.ps1](Test-File-syntax.ps1) invokes `PowerShell -File Error-Syntax.ps1` and shows the exit code 0.
- [Test-File-throw.ps1](Test-File-throw.ps1) invokes `PowerShell -File Error-Throw.ps1` and shows the exit code 0.

---

- Microsoft Connect [750653](https://connect.microsoft.com/PowerShell/feedback/details/750653)
