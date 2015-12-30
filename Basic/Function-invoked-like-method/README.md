
Semantic of invoking PowerShell functions and object methods is different.

Functions

- Parentheses should not be used.
- Parameters are space separated.
- Parameters are positional or named.
- There are no overloaded functions.

Methods

- Parentheses must be used.
- Parameters are comma separated.
- Parameters are positional.
- There may be overloaded methods.

It is unlikely possible to invoke an object method using function syntax by
mistake, PowerShell will not recognise this as a valid call.

But it is possible to invoke a function using method syntax or just use comma
by mistake for separating parameters. In such cases a function may even work
without errors. But parameter may be not correct, i.e. not as designed.

`Set-StrictMode -Version 2` may help to catch some of such mistakes.

Scripts

- [various.function.calls.ps1](various.function.calls.ps1) shows various function calls with potential mistakes.
- [various.function.calls.strict.ps1](various.function.calls.strict.ps1) - some mistakes can be caught in the strict mode.

---

- Stack Overflow [How do I pass multiple parameters into a function in PowerShell?](http://stackoverflow.com/q/4988226/323582)
