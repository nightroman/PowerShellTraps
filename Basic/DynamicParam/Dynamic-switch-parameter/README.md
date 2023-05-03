# Dynamic switch parameter

Dynamic switches specified before positional parameters with omitted names
affect positional arguments and make commands invalid, either due to incorrect
syntax or shifted arguments. Note, commands may even work without errors with
incorrectly treated parameters.

Workarounds

- Specify dynamic switches after positional parameters.
- Do not omit parameter names of positional parameters.

> Used to work as a workaround, not working anymore in the latest v5.1+
> - Specify dynamic switches with values `-ReadOnly:$true`.

Scripts

- [dynamic.switch.fails.ps1](dynamic.switch.fails.ps1) shows how a dynamic switch causes an error.
- [dynamic.switch.works.ps1](dynamic.switch.works.ps1) is the above script corrected.

---

- Stack Overflow [Dynamic switches before positional parameters may not work as expected](http://stackoverflow.com/q/25560038/323582)
- Invoke-Build [#4](https://github.com/nightroman/Invoke-Build/issues/4)
- PowerShell [#19495](https://github.com/PowerShell/PowerShell/issues/19495)
- Microsoft Connect 960194
