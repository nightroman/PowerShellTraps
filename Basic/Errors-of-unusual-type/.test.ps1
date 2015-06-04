
$Version = $PSVersionTable.PSVersion

task missing.command.1 {
	($r = PowerShell -Version $Version -NoProfile .\missing.command.1.ps1 | Out-String)
	assert ($LASTEXITCODE -eq 0)
	assert ($r -like '*FullyQualifiedErrorId : CommandNotFoundException*Continued after missing-command*')
}

task missing.command.2 {
	($r = PowerShell -Version $Version -NoProfile .\missing.command.2.ps1)
	assert ($LASTEXITCODE -eq 0)
	assert ($r -eq 'Caught CommandNotFoundException')
}

task missing.command.3 {
	($r = PowerShell -Version $Version -NoProfile .\missing.command.3.ps1)
	assert ($LASTEXITCODE -eq 0)
	assert ($r -eq 'Caught CommandNotFoundException')
}

task test.2.1.division.by.zero {
	($r = PowerShell -Version $Version -NoProfile .\test.2.1.division.by.zero.ps1 | Out-String)
	assert ($LASTEXITCODE -eq 0)
	assert ($r -like '*FullyQualifiedErrorId : RuntimeException*Continued after error*')
}

task test.2.2.division.by.zero {
	($r = PowerShell -Version $Version -NoProfile .\test.2.2.division.by.zero.ps1)
	assert ($LASTEXITCODE -eq 0)
	assert ($r -eq 'Caught RuntimeException')
}

task test.3.1.method.arguments {
	($r = PowerShell -Version $Version -NoProfile .\test.3.1.method.arguments.ps1 | Out-String)
	assert ($LASTEXITCODE -eq 0)
	assert ($r -like '*FullyQualifiedErrorId : MethodCountCouldNotFindBest*Continued after error*')
}

task test.3.2.method.arguments {
	($r = PowerShell -Version $Version -NoProfile .\test.3.2.method.arguments.ps1)
	assert ($LASTEXITCODE -eq 0)
	assert ($r -eq 'Caught MethodCountCouldNotFindBest')
}

task test.4.1.cannot.convert {
	($r = PowerShell -Version $Version -NoProfile .\test.4.1.cannot.convert.ps1 | Out-String)
	assert ($LASTEXITCODE -eq 0)
	if ($Version.Major -eq 2) {
		assert ($r -like '*FullyQualifiedErrorId : RuntimeException*Continued after error*')
	}
	else {
		assert ($r -like '*FullyQualifiedErrorId : ConvertToFinalInvalidCastException*Continued after error*')
	}
}

task test.4.2.cannot.convert {
	($r = PowerShell -Version $Version -NoProfile .\test.4.2.cannot.convert.ps1)
	assert ($LASTEXITCODE -eq 0)
	if ($Version.Major -eq 2) {
		assert ($r -eq 'Caught RuntimeException')
	}
	else {
		assert ($r -eq 'Caught ConvertToFinalInvalidCastException')
	}
}

task test.5.1.missing.type {
	($r = PowerShell -Version $Version -NoProfile .\test.5.1.missing.type.ps1 | Out-String)
	assert ($LASTEXITCODE -eq 0)
	assert ($r -like '*FullyQualifiedErrorId : TypeNotFound*Continued after error*')
}

task test.5.2.missing.type {
	($r = PowerShell -Version $Version -NoProfile .\test.5.2.missing.type.ps1 | Out-String)
	assert ($LASTEXITCODE -eq 0)
	# Hmm, a new line in the end of FullyQualifiedErrorId
	assert ($r.TrimEnd() -eq 'Caught TypeNotFound')
}

task test.6.1.missing.property.strict {
	($r = PowerShell -Version $Version -NoProfile .\test.6.1.missing.property.strict.ps1 | Out-String)
	assert ($LASTEXITCODE -eq 0)
	assert ($r -like '*FullyQualifiedErrorId : PropertyNotFoundStrict*Continued after error*')
}

task test.6.2.missing.property.strict {
	($r = PowerShell -Version $Version -NoProfile .\test.6.2.missing.property.strict.ps1 | Out-String)
	assert ($LASTEXITCODE -eq 0)
	# Hmm, a new line in the end of FullyQualifiedErrorId
	assert ($r.TrimEnd() -eq 'Caught PropertyNotFoundStrict')
}

task test.7.1.missing.variable.strict {
	($r = PowerShell -Version $Version -NoProfile .\test.7.1.missing.variable.strict.ps1 | Out-String)
	assert ($LASTEXITCODE -eq 0)
	assert ($r -like '*FullyQualifiedErrorId : VariableIsUndefined*Continued after error*')
}

task test.7.2.missing.variable.strict {
	($r = PowerShell -Version $Version -NoProfile .\test.7.2.missing.variable.strict.ps1 | Out-String)
	assert ($LASTEXITCODE -eq 0)
	# Hmm, a new line in the end of FullyQualifiedErrorId
	assert ($r.TrimEnd() -eq 'Caught VariableIsUndefined')
}
