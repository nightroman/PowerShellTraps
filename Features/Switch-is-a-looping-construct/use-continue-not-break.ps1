
<#
.Synopsis
	'continue', not 'break', should be used for stopping case checks.

.Description
	The script contains three tests of three similar 'switch'. The idea is to
	process 1 and 2 and ignore other values. Tests use script blocks as switch
	conditions in order to track their invocations.
#>

# results of 3 tests
$results = New-Object System.Collections.Specialized.OrderedDictionary

# adds a message to the current $script:log
function Write-Log($message) {
	$script:log += $message
}

# gets true if $value is equal to $test
function Test-Condition($value, $test) {
	Write-Log "Testing $value with $test"
	$value -eq $test
}

### Test1 - correct but not effective

$log = [System.Collections.ArrayList]@()
$out = switch(1..3) {
	{Test-Condition $_ 1} {'this is 1'}
	{Test-Condition $_ 2} {'this is 2'}
}
$results.out1 = $out
$results.log1 = $log

### Test 2 - incorrect

$log = [System.Collections.ArrayList]@()
$out = switch(1..3) {
	{Test-Condition $_ 1} {'this is 1'; break}
	{Test-Condition $_ 2} {'this is 2'}
}
$results.out2 = $out
$results.log2 = $log

### Test 3 - correct and effective

$log = [System.Collections.ArrayList]@()
$out = switch(1..3) {
	{Test-Condition $_ 1} {'this is 1'; continue}
	{Test-Condition $_ 2} {'this is 2'}
}
$results.out3 = $out
$results.log3 = $log

# show results, points of interest:
# - log1 shows redundant 'Testing 1 with 2'
# - out2 shows incorrect result
$results
