
Demo scripts are accompanied with `*.test.ps1` files. They are collections of
test tasks invoked by the standalone script [Invoke-Build.ps1]. v2.14.0 or
above is required. Examples of using *Invoke-Build* for testing:

Invoke the task `SomeTest` in `Some.test.ps1`:

    PS> Invoke-Build SomeTest Some.test.ps1

Invoke all tests in `Some.test.ps1`:

    PS> Invoke-Build * Some.test.ps1

Invoke all `*.test.ps1` files in the current directory recursively:

    PS> Invoke-Build ** -Safe -Summary

[Invoke-Build.ps1]: https://github.com/nightroman/Invoke-Build/blob/master/Invoke-Build.ps1
