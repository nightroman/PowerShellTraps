# Different positional parameters in powershell and pwsh

In v5- `powershell` treated unknown arguments as a command line to execute.
To align with POSIX so that things like shebang scripts work correctly, v6
changes `powershell` (now `pwsh`) so that it treats unknown arguments (aka
positional argument) as a file.

As a result, commands that do not specify the parameter name `-File` or
`-Command` explicitly may fail either in v5- or in v6+.

When v6+ PowerShell executable at some point became `pwsh` the issue is less
likely, i.e. it is not possible to use same commands with Windows PowerShell
v3-v5 and PowerShell Core v6+.

---

- [Test-1.v5.works.v6.fails.ps1](Test-1.v5.works.v6.fails.ps1)
    - works in v5
    - fails in v6+
- [Test-2.v6.works.v5.fails.ps1](Test-2.v6.works.v5.fails.ps1)
    - fails in v5
    - fails in v7.2.1
    - seems to work in between

---

- [#4019](https://github.com/PowerShell/PowerShell/pull/4019)
