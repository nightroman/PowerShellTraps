# Methods do not see implicitly created variables

PowerShell variables are not always created by explicit assignments of values.
PowerShell provides other ways like cmdlets `New-Variable`, `Set-Variable`,
the *Variable* provider cmdlets, PowerShell API methods.

Such implicitly created variables may be not seen as created in PowerShell class methods.

Scripts:

- [Test-1.function.ps1](Test-1.function.ps1) - creates a variable by `Set-Variable` and works fine without using classes.
- [Test-2.method.ps1](Test-2.method.ps1) - uses the similar code with a class method and fails, shows the problem.
- [Test-3.workaround.ps1](Test-3.workaround.ps1) - shows a workaround for the scenario with classes.

***

- [Mdbc/issues/23](https://github.com/nightroman/Mdbc/issues/23)
