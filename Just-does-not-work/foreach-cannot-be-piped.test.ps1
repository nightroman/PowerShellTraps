
task ThisWorks {
	$result = foreach($e in 1..5) {$e}
	$result | %{"Result is $_"}
}

task ThisFails {
	($r = try {.\foreach-cannot-be-piped.ps1} catch {$_})
	assert ($r.FullyQualifiedErrorId -eq 'EmptyPipeElement')
}

task Workaround1 {
	$(foreach($e in 1..5) {$e}) | %{"Result is $_"}
}

task Workaround2 {
	@(foreach($e in 1..5) {$e}) | %{"Result is $_"}
}

task Workaround3 {
	.{foreach($e in 1..5) {$e}} | %{"Result is $_"}
}
