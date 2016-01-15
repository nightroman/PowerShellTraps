
PowerShell v5 comes with a new feature. Instead of old fashioned

    New-Object System.Text.StringBuilder

it is possible to use the new syntax

    [System.Text.StringBuilder]::new()

The new syntax introduces an issue. If a class has a static method `New` then
it cannot be called directly. PowerShell treats it as the constructor, not the
static method.

This code works in PowerShell v4 ([Test-1.ps1](Test-1.ps1))

    [System.Linq.Expressions.Expression]::New([psobject])

It calls the static method `New` and creates an expression.

In v5 it fails

    Cannot find an overload for "new" and the argument count: "1".

The workaround ([Test-2.ps1](Test-2.ps1))

    [System.Linq.Expressions.Expression]::New.Invoke([psobject])

***

- Stack Overflow [v5 special method New conflicts with static methods New](http://stackoverflow.com/q/34816021/323582)
