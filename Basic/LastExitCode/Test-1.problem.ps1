
# This function is "innocent", it does not mess with setting $LASTEXITCODE. But
# it checks for $LASTEXITCODE, not $global:LASTEXITCODE, so it may be broken by
# some parent scope code and return 'worked' instead of expected 'failed'.

function Test-VulnerableCode {
	cmd /c exit 42
	if ($LASTEXITCODE) {
		'failed'
	}
	else {
		'worked'
	}
}

# This function messes with $LASTEXITCODE and then calls Test-VulnerableCode.
# As a result, Test-VulnerableCode works incorrectly.

function Test-MessWithLastExitCode {
	$LASTEXITCODE = 0
	Test-VulnerableCode
}

Test-MessWithLastExitCode
