
# This script uses [PowerShell] without runspace pools. Printed handle and
# memory numbers stay within reasonable ranges. Stop manually by Ctrl+C or
# close the console.

for() {
	$ps1 = [PowerShell]::Create()

	$job1 = $ps1.AddScript('Get-Date').BeginInvoke()
	$null = $job1.AsyncWaitHandle.WaitOne()
	$result = $ps1.EndInvoke($job1)

	$ps1.Dispose()

	$p = Get-Process -Id $PID
	"$result Handles: $($p.HandleCount) Memory: $($p.PrivateMemorySize64 / 1mb) mb"
}
