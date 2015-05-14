
# number of input objects
$n = 10kb

# process by by Where-Object
$ForEachObject = {
	1..$n | Where-Object {$true}
}

# process by .{process{if ...}}
$ScriptBlock = {
	1..$n | .{process{ if ($true) {$_} }}
}

# measure two cases and output the results
@{
	ForEachObject = (Measure-Command $ForEachObject).TotalMilliseconds
	ScriptBlock = (Measure-Command $ScriptBlock).TotalMilliseconds
}
