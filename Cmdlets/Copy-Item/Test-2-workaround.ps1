
$PSScriptRoot = Split-Path $MyInvocation.MyCommand.Definition
$Source = "$PSScriptRoot\1"
$Target = "$PSScriptRoot\2"

# remove test files, create result collector
Remove-Item $Source, $Target -Force -Recurse -ErrorAction 0
$log = New-Object System.Collections.Specialized.OrderedDictionary

# make test input, a source directory and a file in it
$null = mkdir $Source
42 > "$Source\test.txt"

# this is the workaround copy
function Test-Workaround {
	# workaround step 1, ensure the destination directory
	$null = mkdir $Target -Force

	# workaround step 2, copy not "source" but "all from source"
	Copy-Item -Path $Source\* -Destination $Target -Recurse -Force
}

# test workaround with no target files
Test-Workaround
$log.files1 = Get-ChildItem $Target -Recurse -Name

# test workaround with target files
Test-Workaround
$log.files2 = Get-ChildItem $Target -Recurse -Name

# remove test files, output results
Remove-Item $Source, $Target -Force -Recurse
$log
