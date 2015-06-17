
When the strict mode is set then it is propagated to the current and child
scopes in scripts but not in modules.

Scripts

- *Script1.ps1* reads a missing variable.
- *Script2.ps1* defines a function that reads a missing variable.
- *Module1.psm1* defines a function that reads a missing variable.
- *Test-1-Script1.ps1* sets the strict mode and invokes *Script1*, it fails.
- *Test-2-Script2.ps1* sets the strict mode, dot-sources *Script2*, and invokes the function, it fails.
- *Test-3-Module1.ps1* sets the strict mode, imports *Module1*, and invokes the function, it does not fail.

---

- Stack Overflow [question](http://stackoverflow.com/questions/30875599/set-strict-mode-in-powershell-for-all-modules)
