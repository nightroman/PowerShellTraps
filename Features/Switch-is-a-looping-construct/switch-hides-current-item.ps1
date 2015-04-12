
<#
.Synopsis
	"switch" current object hides "ForEach-Object" current object.

.Description
	If the idea is for each word to print the word and tell if its length is 3
	or not 3 then this script is not correct. "$_" inside "switch" is not the
	current word, it is the current switch value, the word length.

	The correct code which still uses "switch" has to store the current object
	$_ to another variable $word and use this variable inside "switch":

		$words | ForEach-Object {
			$word = $_
			switch($_.Length) {
				3 { "Word '$word' length is 3." }
				default { "Word '$word' length is not 3." }
			}
		}

	Or "switch" may be replaced with "if" statements to avoid this issue.
#>

$words = 'one', 'two', 'three'

$words | ForEach-Object {
	switch($_.Length) {
		3 { "Word '$_' length is 3." }
		default { "Word '$_' length is not 3." }
	}
}
