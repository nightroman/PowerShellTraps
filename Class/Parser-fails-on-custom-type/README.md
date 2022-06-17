# Parser fails on custom type

If a script adds a custom type by `Add-Type` and then defines a class which
uses this type directly then the parser fails to process such a script.

The script [Test-1.parser.fails.ps1](Test-1.parser.fails.ps1) shows the issue.

### Workaround 1

See the script [Test-2.1.workaround.ps1](Test-2.1.workaround.ps1). The class
definition is moved to another script and this script is dot-sourced after
`Add-Type`.

### Workaround 2

See the script [Test-2.2.workaround.ps1](Test-2.2.workaround.ps1). The class
avoids explicit custom type literals and converts type names to `[Type]`.

***

- Stack Overflow [Using custom type in PowerShell 5.0 class](http://stackoverflow.com/q/35215295/323582)
