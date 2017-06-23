
## Change positional parameter for powershell.exe from -Command to -File

In v5- `powershell.exe` treated unknown arguments as a command line to execute.
To align with POSIX so that things like shebang scripts work correctly, v6
changes `powershell.exe` so that it treats unknown arguments (aka positional
argument) as a file.

As a result, commands that do not specify the parameter name `-File` or
`-Command` explicitly may fail either in v5- or in v6+.

---

- [Test-1.v5.works.v6.fails.ps1](Test-1.v5.works.v6.fails.ps1) works in v5 but fails in v6
- [Test-2.v6.works.v5.fails.ps1](Test-2.v6.works.v5.fails.ps1) works in v6 but fails in v5

---

- [#4019](https://github.com/PowerShell/PowerShell/pull/4019)
