
<#
.Synopsis
	'continue', not 'break', should be used for skipping next cases.

.Description
	The script contains three similar 'switch' tests. The idea is to process 1
	and 2 and ignore other values. Tests use script blocks as switch conditions
	in order to track their invocations.
#>

# results to be shown and tested by .test.ps1
$results = New-Object System.Collections.Specialized.OrderedDictionary

# adds a message to the current $log
function Write-Log($message) {
	$null = $log.Add($message)
}

# gets true if $value is equal to $test and log the call
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
$results.log1 = $log
$results.out1 = $out

### Test 2 - incorrect

$log = [System.Collections.ArrayList]@()
$out = switch(1..3) {
	{Test-Condition $_ 1} {'this is 1'; break}
	{Test-Condition $_ 2} {'this is 2'}
}
$results.log2 = $log
$results.out2 = $out

### Test 3 - correct and effective

$log = [System.Collections.ArrayList]@()
$out = switch(1..3) {
	{Test-Condition $_ 1} {'this is 1'; continue}
	{Test-Condition $_ 2} {'this is 2'}
}
$results.log3 = $log
$results.out3 = $out

# show results, points of interest:
# - log1 shows redundant 'Testing 1 with 2'
# - out2 shows incorrect result
$results
