
If a command name is not recognized as the name of a cmdlet, function, script
file, or operable program then PowerShell emits an error. Is this error
terminating or not? It depends. By default it is not, surprisingly.

If `$ErrorActionPreference` is set to *Stop* then a missing command is
terminating. Otherwise it is not unless the code being invoked is inside a
`try` block, in the current or a parent scope, or a `trap` statement exists.

It looks like constant use of either error action preference *Stop* or `try` or
`trap` blocks in scripts is a good idea. Otherwise simple typos in command
names may cause issues because invocation continues. Note that the default
error action preference is *Continue*.

Scripts

- *missing.command.1.ps1* - shows a not terminating error.
- *missing.command.2.ps1* - shows a terminating error with `try` in the same scope.
- *missing.command.3.ps1* - shows a terminating error with `try` in the parent scope.
- *.test.ps1* - calls the above scripts and checks for the expected results.
