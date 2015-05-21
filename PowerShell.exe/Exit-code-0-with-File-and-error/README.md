
If a PowerShell script throws an error, `PowerShell.exe` will return with an
exit code of 0 when `-File` is used.

Using `Command` to invoke the script causes the correct (failing) exit code to
be returned when the script throws an error.

As far as `Command` returns correct exit codes, this issue may look not serious
until a script path or arguments contain special characters or just spaces.
Quoting and escaping everything correctly for `Command` is difficult. Also,
`Command` may not return the actual exit code of a script, see
[Exit-code-5-with-File-1-with-Command](../Exit-code-5-with-File-1-with-Command).

Scripts

- *broken.ps1* just throws an error.
- *Test-AsCommand.ps1* invokes `PowerShell -Command .\broken.ps1` and shows the exit code 1.
- *Test-AsFile.ps1* invokes `PowerShell -File .\broken.ps1` and shows the exit code 0.

---

- Microsoft Connect [750653](https://connect.microsoft.com/PowerShell/feedback/details/750653)
