
$csv = @'
# first line is a comment
Item, Price
Apple, 0.99
Banana, 2.10
# Pear, 1.99
Orange, 1.50
'@

# One string, comment preserved
$Csv | ConvertFrom-Csv | Out-String

# Several strings, comment ignored
$Csv -split '\r?\n' | ConvertFrom-Csv | Out-String
