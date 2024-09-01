
# Make a text file with 2 lines
$null = New-Item z.txt -Value "hello`nworld" -Force

### Test 1 (expected result)

# with -Raw without -ReadCount
$null = Get-Content z.txt -OutVariable var1 -Raw

# we get a list with 1 string item
"$($var1.GetType()) $($var1.Count) $($var1[0].GetType())"

# and this gets expected text "hello`nworld"
$var1 -join ','

### Test 2 ("unexpected" result)

# with -Raw and -ReadCount
$null = Get-Content z.txt -OutVariable var2 -Raw -ReadCount 0

# we get a list with 1 item, a nested array
"$($var2.GetType()) $($var2.Count) $($var2[0].GetType())"

# and this gets "unexpected" `System.Object[]`
$var2 -join ','
