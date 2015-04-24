
PowerShell is a great tool. But it is not perfect. This is not a problem if one
knows the traps and ways to avoid them. *PowerShellTraps* is a collection of
some bugs and oddities shown by demo scripts and covered by automated tests.
One of the goals is to test future PowerShell versions and see what changes.

Note that for simplicity some demo scripts require that the current PowerShell
location is set to their directory. But this is not needed for automated tests,
they take care of proper current locations themselves.

Demo scripts are accompanied with `*.test.ps1` files. They are collections of
test tasks invoked by the standalone script [Invoke-Build.ps1]. v2.11.1 or
above is recommended. Examples of using *Invoke-Build* for testing:

Invoke the task *SomeTest* in *Some.test.ps1*:

    PS> Invoke-Build SomeTest Some.test.ps1

Invoke all tests in *Some.test.ps1*:

    PS> Invoke-Build * Some.test.ps1

Invoke all `*.test.ps1` files in the current directory recursively:

    PS> Invoke-Build ** -Safe -Summary

Contributions are welcome. Please read [CONTRIBUTING].

[Invoke-Build.ps1]: https://github.com/nightroman/Invoke-Build/blob/master/Invoke-Build.ps1
[CONTRIBUTING]: https://github.com/nightroman/PowerShellTraps/blob/master/CONTRIBUTING.md
