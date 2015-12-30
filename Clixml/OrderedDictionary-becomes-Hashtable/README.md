
If an `OrderedDictionary` is exported by `Export-Clixml` and imported by
`Import-Clixml` then it becomes a `Hashtable`. If the order of items is
important (probably, as far as `OrderedDictionary` is used) then this is
definitely a problem.

The script [Test-OrderedDictionary.ps1](Test-OrderedDictionary.ps1) shows the problem.

Actual output:

    OrderedDictionary
    Hashtable

Expected output:

    OrderedDictionary
    OrderedDictionary

---

- Microsoft Connect [771721](https://connect.microsoft.com/PowerShell/Feedback/Details/771721)
