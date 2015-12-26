
#requires -version 3

# The problem: This loop makes one iteration regardless of the actual number of
# returned objects. The single item $repo is the whole array of result objects.
foreach($repo in Invoke-RestMethod https://api.github.com/users/nightroman/repos) {
	$repo.GetType().Name
}
