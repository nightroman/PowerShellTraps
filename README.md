
PowerShell is great. But it is not perfect. This is not a problem if one knows
the traps and ways to avoid them. *PowerShellTraps* is a collection of some
bugs and oddities shown by demo scripts.

Demo scripts may be accompanied with `*.test.ps1` files. Some issues and their
workarounds may be presented just in `*.test.ps1` files. They are collections
of test tasks invoked by [Invoke-Build.ps1][1]. This script alone is enough,
just put it somewhere in the path. Examples of using *Invoke-Build*:

Invoke the test/task *SomeTest* in *Some.test.ps1*:

    PS> Invoke-Build SomeTest Some.test.ps1

Invoke all tests in *Some.test.ps1*:

    PS> Invoke-Build * Some.test.ps1

Invoke all `*.test.ps1` files in the current directory recursively:

    PS> Invoke-Build **

[1]: https://github.com/nightroman/Invoke-Build/blob/master/Invoke-Build.ps1
