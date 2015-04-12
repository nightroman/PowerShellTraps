
If a script block is passed in a *script* function and invoked there by the dot
operator then it operates in the current scope.

If a script block is passed in a *module* function and invoked there by the dot
operator then it does not operate in the current scope. Where it operates
depends on other factors.

Scripts

- *Script1.ps1* defines the function *Invoke-ScriptBlockParameter* which is used in the module and script.
- *Module1.psm1* dot-sources *Script1.ps1* and exports *Invoke-ScriptBlockParameter* for testing.
- *Test-Module1.ps1* imports *Module1.psm1* and calls *Invoke-ScriptBlockParameter*, the results are strange.
- *Test-Script1.ps1* dot-sources *Script1.ps1* and calls *Invoke-ScriptBlockParameter*, the result is expected.
- *.test.ps1* tests *Test-Script1.ps1* and two ways of invoking *Test-Script1.ps1* with two different results.

#### Workaround

A workaround was suggested by Tom Maddock at Microsoft Connect. A script block
`$ScriptBlock` passed in a module function may be invoked as

    . $MyInvocation.MyCommand.Module $ScriptBlock

In this case `$ScriptBlock` operates in the current scope.

Scripts

- *Workaround/Module2.psm1* exports a function which invokes a script block using the workaround.
- *Workaround/Test-Module2.ps1* imports the module and passes a script block in the function.
- *Workaround/.test.ps1* tests the workaround.

---

- Stack Overflow [Strange behaviour with PowerShell scriptblock variable scope and modules](http://stackoverflow.com/q/2193410/323582)
- Microsoft Connect [560504](https://connect.microsoft.com/PowerShell/Feedback/Details/560504)
