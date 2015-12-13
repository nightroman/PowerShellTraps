
function Test($Name) {
	"Name=$Name"
}

# same object is saved as $x and $$
$x = New-Object PSCustomObject -Property @{Name='Name 1'}
$$ = New-Object PSCustomObject -Property @{Name='Name 1'}

# works as expected
Test $x.Name

# unexpected in v3
Test $$.Name
