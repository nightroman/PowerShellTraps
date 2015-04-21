
# ConvertTo-Json is introduced in Windows PowerShell 3.0
#requires -Version 3

# results to be shown and tested
$results = @{}

# the data
$text = '"{}"'
$data = @{text = $text}

# the data changes on store/restore
($json = $data | ConvertTo-Json)
$data2 = $json | ConvertFrom-Json
$results.WithoutCompress = $data2.text

# the workaround is to use Compress
($json = $data | ConvertTo-Json -Compress)
$data2 = $json | ConvertFrom-Json
$results.WithCompress = $data2.text

# output
$results
