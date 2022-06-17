# `ConvertFrom-Csv` has undocumented partial comment support

When multiple strings are fed into `ConvertFrom-Csv`, it will ignore lines
prefixed with a `#` character. When fed a single string, it retains those
lines. Unless it is the first line, in which case it is ignored either way.

The workaround is to use double quotes around the item with the leading `#`.

The script [Test-1.ps1](Test-1.ps1) shows the issue.

***

- [UserVoice](https://windowsserver.uservoice.com/forums/301869-powershell/suggestions/15121617-convertfrom-csv-has-undocumented-partial-comment-s)
