
$Version = $PSVersionTable.PSVersion.Major

task Test-1.Out-String.ps1 {
	($r = .\Test-1.Out-String.ps1 | Out-String)
	if ($Version -eq 2) {
		assert ($r -cmatch '(?s)^Error {\s+throw :\s+}.*BufferSize.*FullyQualifiedErrorId : PropertyNotFoundStrict')
	}
	else {
		assert ($r -cmatch '(?s)^Error {\s+}.*BufferSize.*FullyQualifiedErrorId : PropertyNotFoundStrict')
	}
}

task Test-2.Format-List {
	($r = .\Test-2.Format-List.ps1 | Out-String)
	if ($Version -eq 2) {
		assert ($r -cmatch '(?s)^Error {\s+throw :\s+}.*BufferSize.*FullyQualifiedErrorId : PropertyNotFoundStrict')
	}
	else {
		assert ($r -cmatch '(?s)^Error {\s+}.*BufferSize.*FullyQualifiedErrorId : PropertyNotFoundStrict')
	}
}

task Test-3.manual.formatting {
	($r = .\Test-3.manual.formatting.ps1)
	assert ($r -cmatch '(?s)^Oops!.*throw.*\+ CategoryInfo          : OperationStopped:.*\+ FullyQualifiedErrorId : Oops!')
}
