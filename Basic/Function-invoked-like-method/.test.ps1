
task various.function.calls {
	($r = .\various.function.calls.ps1)
	equals 'Param1 = 1; Param2 = 2|Param1 = 1 2; Param2 = |Param1 = 1 2; Param2 = |Param1 = 1 2; Param2 = ' ($r -join '|')
}

task various.function.calls.strict {
	($r = try {.\various.function.calls.strict.ps1} catch {$_})
	equals 'Param1 = 1; Param2 = 2|Param1 = 1 2; Param2 = |Param1 = 1 2; Param2 = ' ($r[0..2] -join '|')
	equals $r[3].FullyQualifiedErrorId 'StrictModeFunctionCallWithParens'
}
