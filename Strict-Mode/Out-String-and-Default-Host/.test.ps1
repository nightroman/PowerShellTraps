
# Synopsis: Expected error formatted by Out-String and the same error formatted by default.
task Out-String-works {
	($r = .\Out-String-works.ps1 | Out-String)
	assert ($r -clike 'Error {*Oops!*FullyQualifiedErrorId : Oops!*}*Oops!*FullyQualifiedErrorId : Oops!*')
}

# Synopsis: Unexpected nothing from Out-String and the missing Width error.
# Text: Property 'Width' cannot be found on this object...
# Code: $width = $host.UI.RawUI.BufferSize.Width ...
task Out-String-fails {
	($r = .\Out-String-fails.ps1 | Out-String)
	if ('2.0' -eq $PSVersionTable.PSVersion) {
		assert ($r -cmatch '(?s)^Error {\s+throw :\s+}.*FullyQualifiedErrorId : PropertyNotFoundStrict')
	}
	else {
		assert ($r -cmatch '(?s)^Error {\s+}.*FullyQualifiedErrorId : PropertyNotFoundStrict')
	}
}
