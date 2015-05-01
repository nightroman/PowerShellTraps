
for($n = 1; $n -le 2; ++$n) {
	"begin $n"
	.\Invoke-Break.ps1
	# not invoked
	"end $n"
}
# invoked
'end'
