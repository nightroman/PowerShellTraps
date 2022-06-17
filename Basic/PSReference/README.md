# `[ref]` may be unwrapped unexpectedly

`[ref]` may be used for functions returning something via `[ref]` parameters in
addition to the output or instead of the output.

See

    help about_Ref

There may be problems though when by design `[ref]` is just one of the possible
parameter types. In PowerShell such parameters are normally declared as
`[object]` or `[object[]]`. Namely, `[ref]` may be unexpectedly unwrapped or
expectedly sent as `[ref]` depending (surprisingly) on using or omitting the
parameter name.

Scripts

- [Test-1.lost.ref.object.ps1](Test-1.lost.ref.object.ps1) shows the issue for the `[object]` parameter.
- [Test-2.lost.ref.array.ps1](Test-2.lost.ref.array.ps1) shows the issue for the `[object[]]` parameter.

***

- [PowerShell/issues/5535](https://github.com/PowerShell/PowerShell/issues/5535)
