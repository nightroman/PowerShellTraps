
#requires -version 3
[System.Net.ServicePointManager]::SecurityProtocol = "$([System.Net.ServicePointManager]::SecurityProtocol),Tls11,Tls12"

# The workaround: Cache Invoke-RestMethod result in a variable before foreach.
$repos = Invoke-RestMethod https://api.github.com/users/nightroman/repos
foreach($repo in $repos) {
	$repo.GetType().Name
}
