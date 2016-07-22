
According to the documentation, there are two types of PowerShell errors,
terminating and non-terminating.

There is yet another obscure third type of errors. Such errors are caught by
`try` and `trap`, i.e. they behave like terminating, but they do not stop
execution without `try` or `trap`, i.e. they behave like non-terminating.

For example, if a command name is not recognized as the name of a cmdlet,
function, script file, or operable program then PowerShell emits an error. Is
this error terminating or not? It depends. By default it is not, surprisingly.

It looks like constant use of either error action preference *Stop* or `try` or
`trap` blocks in scripts is a good idea. Otherwise semi-terminating errors may
cause problems because invocation continues. Note that the default error action
preference is *Continue*.

Examples of semi-terminating errors:

1. A command is not found.
1. Division by zero.
1. Calling .NET methods with wrong arguments.
1. PowerShell cannot convert data to some type.
1. A .NET type is not found.
1. A property is not found in the strict mode.
1. A variable is not found in the strict mode.
1. A command parameter is not found.
1. Assignment to not writable variables.
1. Not supported provider features.
1. A .NET exception.

Hypothesis

The tests give the idea that any runtime exception is a semi-terminating error.
True terminating errors are caused by `throw` in scripts.

Scripts

- [missing.command.1.ps1](missing.command.1.ps1) - shows a not terminating error.
- [missing.command.2.ps1](missing.command.2.ps1) - shows a terminating error with `try` in the same scope.
- [missing.command.3.ps1](missing.command.3.ps1) - shows a terminating error with `try` in the parent scope.
- [test.2.1.division.by.zero.ps1](test.2.1.division.by.zero.ps1) - non-terminating error.
- [test.2.2.division.by.zero.ps1](test.2.2.division.by.zero.ps1) - terminating error.
- [test.3.1.method.arguments.ps1](test.3.1.method.arguments.ps1) - non-terminating error.
- [test.3.2.method.arguments.ps1](test.3.2.method.arguments.ps1) - terminating error.
- [test.4.1.cannot.convert.ps1](test.4.1.cannot.convert.ps1) - non-terminating error.
- [test.4.2.cannot.convert.ps1](test.4.2.cannot.convert.ps1) - terminating error.
- [test.5.1.missing.type.ps1](test.5.1.missing.type.ps1) - non-terminating error.
- [test.5.2.missing.type.ps1](test.5.2.missing.type.ps1) - terminating error.
- [test.6.1.missing.property.strict.ps1](test.6.1.missing.property.strict.ps1) - non-terminating error.
- [test.6.2.missing.property.strict.ps1](test.6.2.missing.property.strict.ps1) - terminating error.
- [test.7.1.missing.variable.strict.ps1](test.7.1.missing.variable.strict.ps1) - non-terminating error.
- [test.7.2.missing.variable.strict.ps1](test.7.2.missing.variable.strict.ps1) - terminating error.
- [test.8.1.command.parameter.ps1](test.8.1.command.parameter.ps1) - non-terminating error.
- [test.8.2.command.parameter.ps1](test.8.2.command.parameter.ps1) - terminating error.
- [test.9.1.VariableNotWritable.ps1](test.9.1.VariableNotWritable.ps1) - non-terminating error.
- [test.9.2.VariableNotWritable.ps1](test.9.2.VariableNotWritable.ps1) - terminating error.
- [test.10.1.provider.NotSupported.ps1](test.10.1.provider.NotSupported.ps1) - non-terminating error.
- [test.10.2.provider.NotSupported.ps1](test.10.2.provider.NotSupported.ps1) - terminating error.
- [test.11.1.exception.ps1](test.11.1.exception.ps1) - non-terminating error.
- [test.11.2.exception.ps1](test.11.2.exception.ps1) - terminating error.

---

- [Try-and-trap-catch-terminating-errors](../Try-and-trap-catch-terminating-errors)
- Stack Overflow [The obscure third type of error](http://stackoverflow.com/q/29883990/323582)
- Stack Overflow [How do I make non_existent_cmd a terminating error?](http://stackoverflow.com/q/34597303/323582)
