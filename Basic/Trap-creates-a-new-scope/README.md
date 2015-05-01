
Statements in a `trap` block are invoked in a new scope. This fact may be not
obvious. For example, statements is a similar `catch` block are invoked in the
same scope.

Scripts

- *trap.new.scope.1.incorrect.ps1* - The difference between statements with `trap` and `catch`.
- *trap.new.scope.2.workaround.ps1* - Workaround with `Set-Variable -Scope 1`.
- *trap.new.scope.3.workaround.ps1* - Workaround with a hashtable.

---

- Microsoft Connect [224294](https://connect.microsoft.com/PowerShell/Feedback/Details/224294)
