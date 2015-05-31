
This issue is similar to [Too-simple-function-names](../../Basic/Too-simple-function-names).
It shows that the same problem is possible in script modules.

If a module function name X, exported or internal, is accidentally the same as
an existing global alias and other module functions call X then this alias is
invoked instead of the function X.

It looks like a good idea to use the Verb-Noun convention even for internal
module function names. This minimizes chances of conflicts. Aliases are not
normally called Verb-Noun.

If a script defines aliases in its script scope then these aliases become
global if the script is invoked in the global scope. This explains the
differences between the test 1 (no conflicts) and 2 and 3 (conflicts).

Scripts

- *MyModule.psm1* contains the internal function *MyCommand*.
- *MyScript.ps1* shows the potential issue due to the alias *MyCommand*.
- *Test-1-Command-no-conflicts.ps1* invokes `PowerShell -Command .\MyScript.ps1`, it works without conflicts.
- *Test-2-Command-conflicts.ps1* invokes `PowerShell -Command . .\MyScript.ps1`, it shows name conflicts.
- *Test-3-File-conflicts.ps1* invokes `PowerShell -File MyScript.ps1`, it shows name conflicts.
