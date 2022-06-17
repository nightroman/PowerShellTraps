# Exit code 0 with Command syntax error

If a command passed in `PowerShell -Command` has a syntax error then PowerShell
exit code is 0 (success).

The script [Test-SyntaxError.ps1](Test-SyntaxError.ps1) invokes a command with a syntax error and
shows the exit code 0.

- v5 - fixed, the exit code is 1 (error).
- v7.0.0-preview.5 - exit code 1 but there is no error message printed

Ideally, use only tested commands. If it is not possible to invoke a command
for testing then at least check its syntax. Wrap it with a script block, i.e.
with braces, and invoke the whole command with it:

```batchfile
PowerShell [options] {<command>}
```

Invoke the test command in a batch file or a PowerShell script depending on how
it is going to be used because parsing of arguments may be different.

If a command is very complex consider to compose it is a script and invoke this
script by `PowerShell -Command`. In such a case if a script has a syntax error
then the exit code is 1 (failure).

---

- Microsoft Connect 750654
