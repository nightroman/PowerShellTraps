# Too simple function names

Too simple function names in a script is a time bomb. A script may work fine
until it is called in a session with an alias with accidentally the same name
as a script function. This alias is invoked by a script, not an internal
function, because on command name resolution PowerShell looks for an alias
first. See help *about_Command_Precedence*.

Results are unpredictable. A script may even work without errors doing
something unexpected until the problem is revealed somehow.

It looks like a good idea to use the Verb-Noun convention even for internal
function names. This minimizes chances of conflicts. Aliases are not normally
called Verb-Noun.

Note that script modules may have similar issues, see [Conflict-with-aliases](../../Module/Conflict-with-aliases).

Scripts

- [MyScript.ps1](MyScript.ps1) defines and invokes the internal function *MyCommand*.
- [Test-MyScript.ps1](Test-MyScript.ps1) shows the potential issue with *MyCommand*.

---

- *scoop* issue [#351](https://github.com/lukesampson/scoop/issues/351)
