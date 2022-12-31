
#requires -version 3
[System.Net.ServicePointManager]::SecurityProtocol = "$([System.Net.ServicePointManager]::SecurityProtocol),Tls11,Tls12"

# The problem: This loop makes one iteration regardless of the actual number of
# returned objects. The single item $repo is the whole array of result objects.
$headers = @{authorization = "Bearer $env:GITHUB_TOKEN"}
foreach($repo in Invoke-RestMethod https://api.github.com/users/nightroman/repos -Headers $headers) {
	$repo.GetType().Name
}
