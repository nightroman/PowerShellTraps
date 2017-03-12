
# The command has a syntax error (TerminatorExpectedAtEndOfString)
PowerShell -Version $PSVersionTable.PSVersion -NoProfile -Command "Get-Item 'README.md"

# But the exit code is 0 (success).
# This seems to be fixed in v5.
"Exit code: $global:LASTEXITCODE"
