
# number of input objects
$n = 10kb

# process by ForEach-Object
$ForEachObject = {
	1..$n | ForEach-Object {}
}

# process by .{process{}}
$ScriptBlock = {
	1..$n | .{process{}}
}

# measure two cases and output the results
@{
	ForEachObject = (Measure-Command $ForEachObject).TotalMilliseconds
	ScriptBlock = (Measure-Command $ScriptBlock).TotalMilliseconds
}
