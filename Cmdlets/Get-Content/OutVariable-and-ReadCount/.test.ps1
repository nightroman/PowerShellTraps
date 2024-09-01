
Exit-Build {remove z.txt}

task Test-1.ps1 {
	($1, $2, $3, $4 = .\Test-1.ps1)
	equals $1 'System.Collections.ArrayList 2 string'
	equals $2 'hello,world'
	equals $3 'System.Collections.ArrayList 1 System.Object[]'
	equals $4 'System.Object[]'
}

task Test-2-Raw.ps1 {
	($1, $2, $3, $4 = .\Test-2-Raw.ps1)
	equals $1 'System.Collections.ArrayList 1 string'
	equals $2 "hello`nworld"
	equals $3 'System.Collections.ArrayList 1 System.Object[]'
	equals $4 'System.Object[]'
}
