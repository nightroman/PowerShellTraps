
# This script uses [PowerShell] with runspace pools. Printed handle and memory
# numbers grow over time. Stop manually by Ctrl+C or close the console.
# Otherwise you may run out of memory.

for() {
	$pool = [RunspaceFactory]::CreateRunspacePool(1, 2)
	$pool.Open()

	$ps1 = [PowerShell]::Create()
	$ps1.RunspacePool = $pool

	$job1 = $ps1.AddScript('Get-Date').BeginInvoke()
	$null = $job1.AsyncWaitHandle.WaitOne()
	$result = $ps1.EndInvoke($job1)

	$ps1.Dispose()
	$pool.Close()

	$p = Get-Process -Id $PID
	"$result Handles: $($p.HandleCount) Memory: $($p.PrivateMemorySize64 / 1mb) mb"
}
