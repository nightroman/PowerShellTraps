
What does `trap` without `break` or `continue` do?

Help *about_trap*:

> If you include a Continue statement in a Trap statement, Windows PowerShell
resumes after the statement that caused the error, just as it would without
Break or Continue. With the Continue keyword, however, Windows PowerShell
does not write an error to the error stream.

This is correct but it may sound slightly misleading, as if `trap` without
`break` or `continue` resumes, just as it would with `continue`. It does not
resume, it actually converts a terminating error into non-terminating and the
result, as usually, depends on the current error action preference.

Scripts

- *error.action.continue.ps1* - bare `trap` resumes on error action *Continue*.
- *error.action.stop.ps1* - bare `trap` stops on error action *Stop*.
