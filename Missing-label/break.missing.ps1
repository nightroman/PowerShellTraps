
# these two do not change anything
$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

:outer foreach ($x in 1..5) {
	:inner foreach ($y in 1..5) {
		"$x $y"
		if ($y -ge 2) { break missing }
	}
}

throw 'This is not invoked.'
