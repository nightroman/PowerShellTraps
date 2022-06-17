# Not found variable

If a script module accesses a variable defined in a script that imports this
module then this variable may or may not be found depending on call scenarios
and PowerShell versions.

[Test-Module.ps1](Test-Module.ps1) imports [MyModule.psm1](MyModule.psm1) and
defines `$MyVariable`. Then it calls the imported function `Test-MyVariable`
which tests `$MyVariable`. This variable is not found in v2.

In v5 the variable is found. At this point this may create an illusion that all
is fine. But the problem is revealed in a slightly more complex scenario. When
the working script [Test-Module.ps1](Test-Module.ps1) is called from another
script [Test-Module2.ps1](Test-Module2.ps1) then `$MyVariable` is not found
again.

Scripts [MyScript.ps1](MyScript.ps1), [Test-Script.ps1](Test-Script.ps1), and
[Test-Script2.ps1](Test-Script2.ps1) implement the same call scenarios using
dot-sourcing of the variable `$MyVariable`. All works fine.

***

- [Not-found-function](../Not-found-function)
