# Provider specific filters

PowerShell provider specific cmdlets, e.g. `*-*Item*`, have the parameter
`Filter`. Here is what the help tells for `Get-ChildItem`

    help Get-ChildItem -Parameter Filter

    -Filter <String>
        Specifies a filter in the provider's format or language. The value of
        this parameter qualifies the Path parameter. The syntax of the filter,
        including the use of wildcards, depends on the provider. Filters are
        more efficient than other parameters, because the provider applies them
        when retrieving the objects, rather than having Windows PowerShell
        filter the objects after they are retrieved.

Thus, how `Filter` works completely depends on a provider.

Some providers may not support it at all. For example, `Environment`.
See the script [Test-1.Environment.ps1](Test-1.Environment.ps1).

Other providers may support `Filter` expressions with some complex syntax which
has nothing to do with wildcards.

## FileSystem Filter

The popular provider `FileSystem` supports `Filter` which uses some
wildcard-like syntax. But its wildcards may work in unexpected ways.

### `*.*` matches all names, not names with a dot

See the script [Test-2.1.FileSystem.ps1](Test-2.1.FileSystem.ps1).

NOTE:
In v6.2.0-preview.2 it matches names with a dot, as expected.
But v7.0.0-preview.1 works as older v2 - v5.1 again.

### `*.ext` where `ext` is three characters matches `*.ext*`

See the script [Test-2.2.FileSystem.ps1](Test-2.2.FileSystem.ps1).

NOTE: Windows 10 seems to work in a more expected way. But results are
different on different machines, versions, etc.
