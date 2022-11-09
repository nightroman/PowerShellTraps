<#
	The original file change watcher and handler using Get-Event.
	The final script uses some inline C# code instead:
	https://github.com/nightroman/PowerShelf/blob/main/Watch-Directory.ps1
#>

[CmdletBinding()]
param(
	[string]$Path,
	[int]$TestSeconds = 2
)

$events = 'FileChanged', 'FileCreated', 'FileDeleted', 'FileRenamed'
$watcher = $null
try {
	$watcher = [System.IO.FileSystemWatcher]($PSCmdlet.GetUnresolvedProviderPathFromPSPath($Path))
	$watcher.NotifyFilter = 'FileName,LastWrite'

	Register-ObjectEvent $watcher -EventName Changed -SourceIdentifier FileChanged
	Register-ObjectEvent $watcher -EventName Created -SourceIdentifier FileCreated
	Register-ObjectEvent $watcher -EventName Deleted -SourceIdentifier FileDeleted
	Register-ObjectEvent $watcher -EventName Renamed -SourceIdentifier FileRenamed

	$changes = @{}
	for() {
		Start-Sleep -Seconds $TestSeconds

		foreach($e in Get-Event) {
			if ($events -contains $e.SourceIdentifier) {
				$changes[$e.SourceEventArgs.FullPath] = $e.SourceEventArgs.ChangeType
				Remove-Event -EventIdentifier $e.EventIdentifier
			}
		}

		if ($changes.Count) {
			foreach($key in $changes.Keys | Sort-Object) {
				"$($changes[$key]) $key"
			}
			$changes = @{}
		}
	}
}
finally {
	foreach($_ in $events) {
		Unregister-Event -SourceIdentifier $_ -ErrorAction Continue
	}
	$watcher.Dispose()
}
