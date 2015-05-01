
Import-Csv Import-Csv.trims.leading.spaces.csv | .{process{
	"Data1 '$($_.Data1)'"
}}
