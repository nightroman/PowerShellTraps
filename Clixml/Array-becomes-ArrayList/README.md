
If an array `Object[]` is exported by `Export-Clixml` and imported by
`Import-Clixml` then it becomes an `ArrayList`.

*Test-Array.ps1* shows the problem.

Actual output:

    Object[]
    ArrayList

Expected output:

    Object[]
    Object[]

---

- Microsoft Connect [771721](https://connect.microsoft.com/PowerShell/Feedback/Details/771721)
