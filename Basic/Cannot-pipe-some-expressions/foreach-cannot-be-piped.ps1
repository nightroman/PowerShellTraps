
<#
.Synopsis
	foreach statement cannot be piped.

.Description
	This works:

		$result = foreach($e in 1..5) {$e}
		$result | %{"Result is $_"}

	This fails:

		foreach($e in 1..5) {$e} | %{"Result is $_"}

	See workarounds in the test file.
#>

foreach($e in 1..5) {$e} | %{"Result is $_"}
