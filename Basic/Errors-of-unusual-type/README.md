
According to the documentation, there are two types of PowerShell errors,
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
names and other "third type" errors may cause issues because invocation
continues. Note that the default error action preference is *Continue*.

Some "third type" errors:

- A command is not found.
- Division by zero.
- Calling .NET methods with wrong arguments.
- PowerShell cannot convert data to some type.
- A .NET type is not found.
- A property is not found in the strict mode.

Scripts

- *missing.command.1.ps1* - shows a not terminating error.
- *missing.command.2.ps1* - shows a terminating error with `try` in the same scope.
- *missing.command.3.ps1* - shows a terminating error with `try` in the parent scope.
- *test.2.1.division.by.zero.ps1* - non-terminating error.
- *test.2.2.division.by.zero.ps1* - terminating error.
- *test.3.1.method.arguments.ps1* - non-terminating error.
- *test.3.2.method.arguments.ps1* - terminating error.
- *test.4.1.cannot.convert.ps1* - non-terminating error.
- *test.4.2.cannot.convert.ps1* - terminating error.
- *test.5.1.missing.type.ps1* - non-terminating error.
- *test.5.2.missing.type.ps1* - terminating error.
- *test.6.1.missing.property.strict.ps1* - non-terminating error.
- *test.6.2.missing.property.strict.ps1* - terminating error.

---

- [Try-and-trap-catch-terminating-errors](../Try-and-trap-catch-terminating-errors)
- Stack Overflow [The obscure third type of error](http://stackoverflow.com/q/29883990/323582)
