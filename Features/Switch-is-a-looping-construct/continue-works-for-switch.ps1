
<#
.Synopsis
	"switch" with "continue" inside "foreach".

.Description
	If the idea is to skip 2 and 3 and process other values then the code of
	this script is incorrect because "continue" works for "switch", not for
	"foreach".

	The correct code should either use a label:

		:for foreach($e in $data) {
			switch($e) {
				2 {continue for}
				3 {continue for}
			}
			"Process $e"
		}

	or use "if" instead of "switch":

		foreach($e in $data) {
			if ($e -eq 2) {continue}
			if ($e -eq 3) {continue}
			"Process $e"
		}

	or just use "switch" as a loop:

		switch($data) {
			2 {continue}
			3 {continue}
			default {"Process $_"}
		}
#>

$data = 1..4

foreach($e in $data) {
	switch($e) {
		2 {continue}
		3 {continue}
	}
	"Process $e"
}
