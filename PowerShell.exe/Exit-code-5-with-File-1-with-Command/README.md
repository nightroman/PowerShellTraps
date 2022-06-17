# Exit code 5 with File, 1 with Command

If `PowerShell.exe` invokes a script which exists with `exit 5` then the exit
code depends on how the script is invoked. If it is invoked with the parameter
`File` then the exit code is 5. If it is invoked with the parameter `Command`
then the exit code is 1.

As far as `File` returns the actual exit code, it looks like that using just
`File` and avoiding `Command` solves the issue, the actual exit code will be
obtained. With `File` there is another issue, see [Exit-code-0-with-File-script-error](../Exit-code-0-with-File-script-error).

Workaround

In order to get the actual exit code on invoking a script with `Command` an
extra statement `exit $LastExitCode` can be used.

Scripts

- [exit-5.ps1](exit-5.ps1) contains just `exit 5`.
- [test.1.file.ps1](test.1.file.ps1) invokes [exit-5.ps1](exit-5.ps1) with `File` and gets the exit code 5.
- [test.2.command.script.ps1](test.2.command.script.ps1) invokes [exit-5.ps1](exit-5.ps1) with `Command` and gets the exit code 1.
- [test.3.command.dot-source.ps1](test.3.command.dot-source.ps1) - ditto but the script is dot-sourced, the exit code is still 1.
- [test.4.command.workaround.ps1](test.4.command.workaround.ps1) - workaround for [test.2.command.script.ps1](test.2.command.script.ps1) and [test.3.command.dot-source.ps1](test.3.command.dot-source.ps1).

---

- Stack Overflow [answer](http://stackoverflow.com/a/30374795/323582)
