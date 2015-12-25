
## Invoke-RestMethod returns an unrolled array

The following command at the moment of writing is supposed to return 8 objects
describing GitHub repositories

    Invoke-RestMethod https://api.github.com/users/nightroman/repos

There is an issue though. It looks like it gets objects as an unrolled array.
This is not a problem if the result is cached in a local variable. But it may
be a problem if `Invoke-RestMethod` is used directly in a `foreach` loop. The
loop always performs a single iteration and the single item is the whole array
of objects. In contrast, if the cached result variable is used in `foreach`
then all items are processed one by one.

Scripts

- [*Test-1.Issue.ps1*](Test-1.Issue.ps1) shows the issue
- [*Test-2.Workaround.ps1*](Test-1.Issue.ps1) shows the workaround

****

- UserVoice [Invoke-RestMethod returns an unrolled array](http://windowsserver.uservoice.com/forums/301869-powershell/suggestions/11201622-invoke-restmethod-returns-an-unrolled-array)
