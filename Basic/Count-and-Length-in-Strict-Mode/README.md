
### Count and Length of a scalar fail in the strict mode

See help *about_Properties*:

    Beginning in Windows PowerShell 3.0, Windows PowerShell tries
    to prevent scripting errors that result from the differing
    properties of scalar objects and collections.

    --  If you request the Count or Length property of zero objects
        or of one object, Windows PowerShell returns the correct value.

The problem is that these properties *Count* and *Length* of a scalar fail in
the strict mode.

Scripts

- *count.works.ps1* shows how *Count* works.
- *count.fails.ps1* shows how *Count* fails.
- *length.works.ps1* shows how *Length* works.
- *length.fails.ps1* shows how *Length* fails.

---

- Microsoft Connect [770111](https://connect.microsoft.com/PowerShell/Feedback/Details/770111)
