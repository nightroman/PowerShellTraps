# The functions has two parameters with `ValueFromPipeline=$true`.
# It is unusual, perhaps a mistake. But it does not cause errors.
function foo {
	[CmdletBinding()]
	param(
		[Parameter(Position=0, ValueFromPipeline=$true)]
		$P1,
		[Parameter(Position=1, ValueFromPipeline=$true)]
		$P2
	)
	process
	{
		"P1=$P1"
		"P2=$P2"
	}
}

# 'v' is assigned to both P1 and P2, this is not an error in PowerShell.
# This behaviour might be unexpected if ValueFromPipeline is a mistake.
'v' | foo

# On the other hand, if two parameters with ValueFromPipeline are by design
# then one can choose which parameter is piped and which is specified. Both
# below commands set $P1='v1' and $P2='v2' in two different ways.
'v2' | foo -P1 v1
'v1' | foo -P2 v2
