# Exit code depends

This case shows different exit codes of PowerShell.exe when it is invoked with
similar commands.

If the command `'Hello'; Write-Error Oops` is invoked by PowerShell.exe then
its exit code is 1. If the same command is a script and the script is invoked
then the exit code is 0. If the script is dot-sourced, i.e. as if the command
is in the command line, then the exit code is still 0.

If the command `Write-Error Oops; 'Hello'` (swapped statements) is invoked then
the exit code is 0. This fact and the other tests give the idea that the exit
code of a command without terminating errors depends on the last statement in
the command line.

Scripts

- [Script1.ps1](Script1.ps1) contains the command with an error.
- [Test-1-command-and-script.ps1](Test-1-command-and-script.ps1) invokes tests:
    - `'Hello'; Write-Error Oops`, exit code is 1
    - invokes it as a script, exit code is 0
    - dot-sources the script, exit code is 0
    - `Write-Error Oops; 'Hello'`, exit code is 0
