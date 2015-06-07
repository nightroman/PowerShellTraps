
There are three ways to invoke a script by `PowerShell.exe`. Assuming a script
is in the current directory, they are:

```powershell
    PowerShell -Command .\Script.ps1
    PowerShell -Command . .\Script.ps1
    PowerShell -File Script.ps1
```

The first command invokes a script in its script scope which is a child of the
global. The script mostly does not affect the global scope unless it explicitly
requires this in some commands or uses the prefix `global` for scoped items.
Mostly, because some automatic variables still may be changed.

The second and third commands invoke a script in the global scope, that is the
script scope and global are the same. In other words, if a script creates or
changes things in its scope then these changes are global.

In some cases changes in the global scope may cause different results and
program flow. For example created global aliases may conflict with script
module functions, see [Conflict-with-aliases](../../Module/Conflict-with-aliases).

Scripts

- *MyScript.ps1* defines some items in the script scope and tries to get them as global.
- *Test-1-Command-normal.ps1* invokes `PowerShell .\MyScript.ps1`, it gets nothing, i.e. the defined items are not global.
- *Test-2-Command-global.ps1* invokes `PowerShell . .\MyScript.ps1`, it gets the global items defined by the script.
- *Test-3-File-global.ps1* invokes `PowerShell -File MyScript.ps1`, it gets the global items defined by the script.
