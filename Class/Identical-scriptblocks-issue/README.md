
If two script blocks with exactly the same code define a class and return its
instance then on invoking them one after another the second call fails with an
error "Unable to find type X".

The script [Test-1.fails.ps1](Test-1.fails.ps1) shows the issue for two
identical script blocks.

The script [Test-2.works.ps1](Test-2.works.ps1) shows that any difference in
script blocks, even in comments, "resolves" the issue.
