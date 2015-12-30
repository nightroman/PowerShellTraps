
If a module function creates a variable in the parent scope then the variable
is created in the module scope, not necessarily the calling scope.

- [Module1.psm1](Module1.psm1) exports the function `New-Variable1` which creates a variable in the parent scope.
- [Test-Module1.ps1](Test-Module1.ps1) calls `New-Variable1` and fails to get the variable `Variable1` in the current scope.

If a script function creates a variable in the parent scope then the variable
is created in the calling scope.

- [Script1.ps1](Script1.ps1) defines the same function `New-Variable1`, as [Module1.psm1](Module1.psm1) does.
- [Test-Script1.ps1](Test-Script1.ps1) calls `New-Variable1` and gets the variable `Variable1` in the current scope.
