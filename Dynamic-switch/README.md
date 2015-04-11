
Dynamic switches specified before positional parameter arguments with omitted
parameter names swallow these arguments and make a command invalid, either due
to incorrect syntax or shifted arguments. In the latter case a command may even
work without errors with incorrect input parameters.

Workarounds

- Specify dynamic switches with values `-ReadOnly:$true`.
- Or specify dynamic switches after positional parameters.
- Or do not omit parameter names of positional parameters.

---

- Stack Overflow [Dynamic switches before positional parameters may not work as expected](http://stackoverflow.com/q/25560038/323582)
- Microsoft Connect [960194](https://connect.microsoft.com/PowerShell/Feedback/Details/960194)
- Invoke-Build [#4](https://github.com/nightroman/Invoke-Build/issues/4)
