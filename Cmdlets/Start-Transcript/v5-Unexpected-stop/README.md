
### v5: Transcription is stopped when a runspace pool is closed

**Fixed in v6**

In PowerShell v5 on using a runspace pool transcription started by
`Start-Transcript` is stopped unexpectedly when the pool is closed.
As a result, expected data are missing in the transcription file.
Also, stopping transcription by `Stop-Transcript` causes an error
because transcription is already stopped.

The script [Test-1.ps1](Test-1.ps1) shows missing data and the error.

****

- [Microsoft Connect](https://connect.microsoft.com/PowerShell/feedback/details/1877597)
