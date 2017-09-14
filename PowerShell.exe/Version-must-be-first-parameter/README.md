
### The PowerShell parameter `Version` must be the first.

This works:

    PowerShell -Version 2 -NoProfile

This fails:

    PowerShell -NoProfile -Version 2

The error message:

> -Version : The term '-Version' is not recognized as the name of a cmdlet,
function, script file, or operable program. Check the spelling of the name,
or if a path was included, verify that the path is correct and try again.

The script [Version-must-be-first-parameter.ps1](Version-must-be-first-parameter.ps1) shows the problem.

***
**v6-beta.7 notes**

Instead of failing PowerShell gets unexpected result. Is this intended?

See `#4834`. It turns out `-Version` is supposed to get just version in v6, not
to call the specified version. Ideally, it should fail if anything else is
provided in the command. But it does not.

Thus, we have another kind of trap. Let's watch it, it's still a beta.

***

- Microsoft Connect [712934](https://connect.microsoft.com/PowerShell/Feedback/Details/712934)
- [PowerShell/issues/4834](https://github.com/PowerShell/PowerShell/issues/4834)
