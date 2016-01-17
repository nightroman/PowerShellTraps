
### ConvertFrom-Json returns an array not unrolled

If JSON represents an array then `ConvertFrom-Json` returns this array not
unrolled. This may cause subtle issues in some scenarios.

Scripts

- [Test-1.Issue.ps1](Test-1.Issue.ps1) shows the issue
- [Test-2.Workaround.ps1](Test-2.Workaround.ps1) shows the workaround with a variable
- [Test-3.Workaround.ps1](Test-3.Workaround.ps1) shows the workaround with parenthesis

***

- [Invoke-RestMethod/Not-unrolled-result](../../Invoke-RestMethod/Not-unrolled-result)
- UserVoice [ConvertFrom-JSON return array values do not seem to be unrolled on the pipeline](http://windowsserver.uservoice.com/forums/301869-powershell/suggestions/11472384)
