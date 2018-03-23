
#requires -version 3
[System.Net.ServicePointManager]::SecurityProtocol = "$([System.Net.ServicePointManager]::SecurityProtocol),Tls11,Tls12"

# The workaround: Use parenthesis enclosing Invoke-RestMethod command.
foreach($repo in (Invoke-RestMethod https://api.github.com/users/nightroman/repos)) {
	$repo.GetType().Name
}
