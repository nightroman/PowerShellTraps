
# some numeric data
$data = [pscustomobject]@{
	Int32 = 42
	Int64 = 42L
	Double = 3.14
	BigInt = 9123123123
}

# round trip
$json = $data | ConvertTo-Json
$data = $json | ConvertFrom-Json

# 5.1: Int32
# 7.4: Int64
$data.Int32.GetType().Name

# 5.1: Int32
# 7.4: Int64
$data.Int64.GetType().Name

# 5.1: Decimal
# 7.4: Double
$data.Double.GetType().Name

# Int64
$data.BigInt.GetType().Name
