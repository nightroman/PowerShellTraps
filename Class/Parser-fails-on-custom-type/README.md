
If a script adds a custom type by `Add-Type` and then defines a class which
uses this type directly then the parser fails to process such a script.

The script [Test-1.parser.fails.ps1](Test-1.parser.fails.ps1) shows the issue.

### Workaround 1

See the script [Test-2.1.workaround.ps1](Test-2.1.workaround.ps1). The class
definition is moved to another script and this script is dot-sourced after
`Add-Type`.

### Workaround 2

See the script [Test-2.2.workaround.ps1](Test-2.2.workaround.ps1). The class
calls `Add-Type` itself and avoids type literals referencing not yet added
custom types in its members.

The script [Test-2.3.workaround.ps1](Test-2.3.workaround.ps1) demonstrates the
same idea. It is simpler but it uses a script variable which is not always
suitable. And the custom type is always added even if the class is not used.

***

- Stack Overflow [Using custom type in PowerShell 5.0 class](http://stackoverflow.com/q/35215295/323582)
