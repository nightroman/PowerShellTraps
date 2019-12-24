# The issue happens when the error action is "Stop", so we keep it.
$ErrorActionPreference = 'Stop'

# Invoke an app which writes something to the error stream.
# 2>$null is supposed to discard the error output.
# Use the script block to set $ErrorActionPreference = 'Continue'.

Set-Location c:\
$output = &{
	$ErrorActionPreference = 'Continue'
	git rev-parse --is-inside-work-tree 2>$null
}

# In this case, the output is empty.
$null -eq $output
