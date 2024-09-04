
# Invocation by & works
$null = & $PSScriptRoot\Test-1.ps1
'Operator & works'

# Dot-sourcing with | Out-Null works
. $PSScriptRoot\Test-1.ps1 | Out-Null
'Dot-sourcing with | Out-Null works'

# Dot-sourcing with > $null works
. $PSScriptRoot\Test-1.ps1 > $null
'Dot-sourcing with > $null works'

# But this dot-sourcing fails
try {
	. $PSScriptRoot\Test-1.ps1
}
catch {
	"$_"
}
