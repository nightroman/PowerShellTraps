
The PowerShell parameter `Version` must be the first.

This works:

    PowerShell -Version 2 -NoProfile

This fails:

    PowerShell -NoProfile -Version 2

The error message:

> -Version : The term '-Version' is not recognized as the name of a cmdlet,
function, script file, or operable program. Check the spelling of the name,
or if a path was included, verify that the path is correct and try again.

The script [Version-must-be-first-parameter.ps1](Version-must-be-first-parameter.ps1) shows the problem.

---

- Microsoft Connect [712934](https://connect.microsoft.com/PowerShell/Feedback/Details/712934)
