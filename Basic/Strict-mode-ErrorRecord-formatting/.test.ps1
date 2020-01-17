
$Version = $PSVersionTable.PSVersion.Major
$ErrorView = 'NormalView' #! v7

task Test-1.Out-String {
	($r = .\Test-1.Out-String.ps1 | Out-String)
	if ($Version -eq 2) {
		assert ($r -cmatch '(?s)^Error {\s+throw :\s+}.*BufferSize.*FullyQualifiedErrorId : PropertyNotFoundStrict')
	}
	elseif ($Version -le 5) {
		assert ($r -cmatch '(?s)^Error {\s+}.*BufferSize.*FullyQualifiedErrorId : PropertyNotFoundStrict')
	}
	else {
		assert ($r -like 'Error {*Oops!*FullyQualifiedErrorId : Oops!*Oops!*FullyQualifiedErrorId : Oops!*')
	}
}

task Test-2.Format-List {
	($r = .\Test-2.Format-List.ps1 | Out-String)
	if ($Version -eq 2) {
		assert ($r -cmatch '(?s)^Error {\s+throw :\s+}.*BufferSize.*FullyQualifiedErrorId : PropertyNotFoundStrict')
	}
	elseif ($Version -le 5) {
		assert ($r -cmatch '(?s)^Error {\s+}.*BufferSize.*FullyQualifiedErrorId : PropertyNotFoundStrict')
	}
	else {
		assert ($r -like 'Error {*Oops!*FullyQualifiedErrorId : Oops!*Oops!*FullyQualifiedErrorId : Oops!*')
	}
}

task Test-3.manual.formatting {
	($r = .\Test-3.manual.formatting.ps1)
	assert ($r -cmatch '(?s)^Oops!.*throw.*\+ CategoryInfo          : OperationStopped:.*\+ FullyQualifiedErrorId : Oops!')
}
