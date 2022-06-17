# `Count` and `Length` of a scalar fail in the strict mode

See help *about_Properties*:

    Beginning in Windows PowerShell 3.0, Windows PowerShell tries
    to prevent scripting errors that result from the differing
    properties of scalar objects and collections.

    --  If you request the Count or Length property of zero objects
        or of one object, Windows PowerShell returns the correct value.

The problem is that these properties *Count* and *Length* of a scalar fail in
the strict mode.

Obviously these properties should not be used in scripts designed to work in
the strict mode. Public scripts should avoid these properties because this mode
can be enabled by a caller.

Scripts

- [count.works.ps1](count.works.ps1) shows how *Count* works.
- [count.fails.ps1](count.fails.ps1) shows how *Count* fails.
- [length.works.ps1](length.works.ps1) shows how *Length* works.
- [length.fails.ps1](length.fails.ps1) shows how *Length* fails.

---

- [Number-of-returned-objects](../../Number-of-returned-objects)
- [Set-StrictMode should not complain about COUNT & LENGTH properties on elements #2798](https://github.com/PowerShell/PowerShell/issues/2798)
- Microsoft Connect 770111
