# Identical script blocks issue

If two script blocks with exactly the same code define a class and return its
instance then on invoking them one after another the second call fails:

- v6.1-preview.2: Error "Object reference not set to an instance of an object."
- v5.1: Error "Parameter name: type" with no source information
- v5.0: Error "Unable to find type X"

The script [Test-1.fails.ps1](Test-1.fails.ps1) shows the issue for two
identical script blocks.

The script [Test-2.works.ps1](Test-2.works.ps1) shows that any difference in
script blocks, even in comments, "resolves" the issue.
