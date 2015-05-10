
task various.function.calls {
	($r = .\various.function.calls.ps1)
	assert ('Param1 = 1; Param2 = 2|Param1 = 1 2; Param2 =|Param1 = 1 2; Param2 =|Param1 = 1 2; Param2 =' -eq $r -join '|')
}

task various.function.calls.strict {
	($r = try {.\various.function.calls.strict.ps1} catch {$_})
	assert ('Param1 = 1; Param2 = 2|Param1 = 1 2; Param2 =|Param1 = 1 2; Param2 =' -eq $r[0..2] -join '|')
	assert ($r[3].FullyQualifiedErrorId -eq 'StrictModeFunctionCallWithParens')
}
