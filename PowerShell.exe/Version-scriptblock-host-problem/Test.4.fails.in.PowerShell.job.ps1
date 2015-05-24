
# This test fails with a confusing error

Start-Job { PowerShell -Version 2 -NoProfile {42} } |
Wait-Job |
Receive-Job
