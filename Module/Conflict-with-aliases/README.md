
This issue is similar to [Too-simple-function-names](../Basic/Too-simple-function-names).
It shows that the same problem is possible in script modules.

If a module function name X, internal or exposed, is accidentally the same as
an existing in the session alias and other module functions call X then this
alias may be invoked instead of the function X.

It looks like a good idea to use the Verb-Noun convention even for internal
module function names. This minimizes chances of conflicts. Aliases are not
normally called Verb-Noun.

Scripts

- *MyModule.psm1* contains the internal function *MyCommand*.
- *Test-MyModule.ps1* shows the potential issue due to the alias *MyCommand*.
- *Test-MyModule-Command-works.ps1* calls *Test-MyModule.ps1* as `PowerShell -Command`, it works as expected.
- *Test-MyModule-File-conflicts.ps1* calls *Test-MyModule.ps1* as `PowerShell -File`, it shows name conflicts.
