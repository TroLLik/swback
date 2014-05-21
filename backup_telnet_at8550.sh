#!/usr/bin/expect -f

if {[llength $argv] != 4} {
	puts "Run: ./backup_telnet_at8550.sh <host> <login> <password> <tftpsrvip>"
	exit 1
}

set timeout 2

set host [lindex $argv 0]
set log [lindex $argv 1]
set pas [lindex $argv 2]
set srvip [lindex $argv 3]

spawn telnet $host
expect "User$*"
send "$log\r"

expect "Password:"
send "$pas\r"

expect "$*#"

send "upload method=tftp file=boot.cfg destfile=reg/$host"

set now [clock seconds]
set date [clock format $now -format {%Y-%b-%d}]

send "_$date.cfg server=$srvip\r"

expect "$*#"
send "logout\r"

expect eof