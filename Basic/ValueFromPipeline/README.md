## ValueFromPipeline used for several parameters

Advanced functions (script cmdlets) use the attribute `ValueFromPipeline` in
order to tell which parameter is used for the pipeline input. Normally there
is one such parameter per a parameter set, or none.

It turns out PowerShell allows using several parameters with `ValueFromPipeline`.
Is it a feature or design flaw? Who knows, usefulness of this feature is not
clear. But if two input parameters are specified by mistake (e.g. copy/paste)
then PowerShell does not fail as one may expect, it binds them to the same
values coming from the pipeline.

[Test-1.ps1](Test-1.ps1) shows how a function with two `ValueFromPipeline`
parameters works with various inputs.

---

- [PowerShellTraps/issues/9](https://github.com/nightroman/PowerShellTraps/issues/9)
