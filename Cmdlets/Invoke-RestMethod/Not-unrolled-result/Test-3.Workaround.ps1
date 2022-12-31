
#requires -version 3
[System.Net.ServicePointManager]::SecurityProtocol = "$([System.Net.ServicePointManager]::SecurityProtocol),Tls11,Tls12"

# The workaround: Use parenthesis enclosing Invoke-RestMethod command.
$headers = @{authorization = "Bearer $env:GITHUB_TOKEN"}
foreach($repo in (Invoke-RestMethod https://api.github.com/users/nightroman/repos -Headers $headers)) {
	$repo.GetType().Name
}
