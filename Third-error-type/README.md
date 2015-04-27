
According to the documentation, there are two types PowerShell errors,
terminating and non-terminating.

There is yet another obscure third type of errors. Such errors are caught by
`try` and `trap`, i.e. they behave like terminating, but they do not stop
execution without `try` or `trap`, i.e. they behave like non-terminating.

For example, if a command name is not recognized as the name of a cmdlet,
function, script file, or operable program then PowerShell emits an error. Is
this error terminating or not? It depends. By default it is not, surprisingly.

If `$ErrorActionPreference` is set to *Stop* then a missing command is
terminating. Otherwise it is not unless the code being invoked is inside a
`try` block, in the current or a parent scope, or a `trap` statement exists.

It looks like constant use of either error action preference *Stop* or `try` or
`trap` blocks in scripts is a good idea. Otherwise simple typos in command
names and some other "third type" errors may cause issues because invocation
continues. Note that the default error action preference is *Continue*.

Some "third type" errors

- Missing command.
- Division by zero.
- Calling .NET methods with wrong arguments.

Scripts

- *missing.command.1.ps1* - shows a not terminating error.
- *missing.command.2.ps1* - shows a terminating error with `try` in the same scope.
- *missing.command.3.ps1* - shows a terminating error with `try` in the parent scope.
- *.test.ps1* - calls the above scripts and checks for the expected results.

---

- Stack Overflow [The obscure third type of error](http://stackoverflow.com/q/29883990/323582)
