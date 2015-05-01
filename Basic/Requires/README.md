
`#requires` works more or less as documented and expected in PowerShell 2.0. In
PowerShell 3.0 it does not.

Help *about_Requires*

> The #Requires statement must be the first item on a line in a script.

This is not true, see *requires-not-first.ps1* and *requires-with-leading-space.ps1*.

Another oddity. `#requiresGarbage` is also treated as `#requires`. Moreover,
PowerShell is happy about this `Garbage` part, it fails due to the version 42.

Tests:

- *requires.ps1*: A proper `#requires` works as expected.
- *requires-not-first.ps1*: Works differently in different versions.
- *requires-with-garbage.ps1*: Works differently in different versions.
- *requires-with-leading-space.ps1*: Works differently in different versions.

*.test.ps1* invokes all tests and checks the results

    Invoke-Build * .test.ps1
