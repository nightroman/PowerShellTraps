# `trap` with `continue`

`continue` in a `trap` block tells PowerShell to resume after the statement
that caused the error. But this is the statement in the scope where the `trap`
is defined, not the statement that actually failed. In other words, PowerShell
resumes where the `trap` is, not where an error is.

Scripts

- [test1.trap.same.scope.ps1](test1.trap.same.scope.ps1) - `trap` in the same scope resumes in the same scope.
- [test2.trap.parent.scope.ps1](test2.trap.parent.scope.ps1) - `trap` in the parent scope resumes in the parent scope.
