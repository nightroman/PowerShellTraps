
$PSScriptRoot = Split-Path $MyInvocation.MyCommand.Definition

# start transcription
Start-Transcript $PSScriptRoot\z.log
'LOG-BEGIN'

# do some work with a runspace pool; in v5 $pool.Close() unexpectedly stops transcription
$pool = [RunspaceFactory]::CreateRunspacePool(1, 1)
$pool.Open()
$ps = [PowerShell]::Create()
$ps.RunspacePool = $pool
$ps.AddScript('"some work"').Invoke()
$pool.Close()

# last transcribed output; in v5 it is not written because transcription is stopped
'LOG-END'

# stop transcription; in v5 it is an error because transcription is stopped
Stop-Transcript -ErrorAction 0

# show transcription
Get-Content z.log
Remove-Item z.log
