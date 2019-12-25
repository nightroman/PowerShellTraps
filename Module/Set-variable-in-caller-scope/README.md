## How to set a variable in the caller scope

Sometimes a function should set a variable in the caller scope.
The way to do this depends on how this function is defined and imported.

Functions defined in scripts may use straightforward `Set-Variable -Scope 1`.
This way is not working in module functions.

Functions defined in modules may use less obvious `$PSCmdlet.SessionState.PSVariable.Set()`.
This way is not working in script functions.

Scripts

- [Lib.ps1](Lib.ps1) defines functions using two different ways of setting a variable.
- [Test-1.script.ps1](Test-1.script.ps1) imports (dot-sources) script functions and shows how they work.
- [Test-2.module.ps1](Test-2.module.ps1) imports module functions ([SetVariable.psm1](SetVariable.psm1)) and shows how they work.
