
`#requires` works more or less as documented and expected in PowerShell 2.0. In
PowerShell 3.0 it does not.

See help *about_Requires*:

> The #Requires statement must be the first item on a line in a script.

This is not true, see [requires-not-first.ps1](requires-not-first.ps1) and [requires-with-leading-space.ps1](requires-with-leading-space.ps1).

Another oddity is that something like `#requiresGarbage` is treated as `#requires`.

Scripts

- [requires.ps1](requires.ps1): A proper `#requires` works as expected.
- [requires-not-first.ps1](requires-not-first.ps1): Works differently in different versions.
- [requires-with-garbage.ps1](requires-with-garbage.ps1): Works differently in different versions.
- [requires-with-leading-space.ps1](requires-with-leading-space.ps1): Works differently in different versions.
