
# The command has a syntax error (TerminatorExpectedAtEndOfString)
PowerShell -Version $PSVersionTable.PSVersion -NoProfile -Command "Get-Item 'README.md"

# But the exit code is 0 (success)
"Exit code: $LASTEXITCODE"
