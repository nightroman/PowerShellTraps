
If a script module calls a function defined in a script that imports this
module then this function may or may not be not found depending on call
scenarios and PowerShell versions.

[Test-Module.ps1](Test-Module.ps1) imports [MyModule.psm1](MyModule.psm1) and
defines the function `MyFunction`. Then it calls the imported function
`Test-MyFunction` which is supposed to call `MyFunction`. This fails in v2
because `MyFunction` is not found.

In v5 this scenario works as expected. At this point this may create an
illusion that all is fine. But the problem is revealed in a slightly more
complex scenario. When the working script [Test-Module.ps1](Test-Module.ps1)
is called from another script [Test-Module2.ps1](Test-Module2.ps1) then
`MyFunction` is not found again.

Scripts [MyScript.ps1](MyScript.ps1), [Test-Script.ps1](Test-Script.ps1), and
[Test-Script2.ps1](Test-Script2.ps1) implement the same call scenarios using
dot-sourcing of the function `Test-MyFunction`. It calls `MyFunction` fine.

***

- [Helps/issues/9](https://github.com/nightroman/Helps/issues/9)
