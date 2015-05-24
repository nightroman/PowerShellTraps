
# This test fails with a confusing error

$ps = [PowerShell]::Create().AddScript({
	PowerShell -Version 2 -NoProfile {42}
})

$ps.Invoke()
$ps.Streams.Error
