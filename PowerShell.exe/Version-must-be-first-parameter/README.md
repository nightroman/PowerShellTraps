
The PowerShell parameter `Version` must be the first.

This works:

    PowerShell -Version 2 -NoProfile

This fails:

    PowerShell -NoProfile -Version 2

The script *Version-must-be-first-parameter.ps1* shows the problem.

---

- Microsoft Connect [712934](https://connect.microsoft.com/PowerShell/Feedback/Details/712934)
