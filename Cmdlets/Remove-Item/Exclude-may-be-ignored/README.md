# `Remove-Item` may ignore items specified by `Exclude`

[Test-1.exclude.file.ps1](Test-1.exclude.file.ps1) shows that the parameter `Exclude` works for the file, at least in v5.1.
In v2 `Exclude` ignores the specified value and removes the file.

[Test-2.exclude.directory.ps1](Test-2.exclude.directory.ps1) shows that the parameter `Exclude` ignores the directory.

***

- [UserVoice](https://windowsserver.uservoice.com/forums/301869-powershell/suggestions/16591075-remove-item-recurse-exclude-does-not-work-at-le)
