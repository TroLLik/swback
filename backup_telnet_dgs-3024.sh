#!/usr/bin/expect -f

if {[llength $argv] != 4} {
	puts "Run: ./backup_telnet_dgs-3024.sh <host> <login> <password> <tftpsrvip>"
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

expect "Pass$*"
send "$pas\r"

expect "$*#"

send "upload configuration $srvip reg/$host"

set now [clock seconds]
set date [clock format $now -format {%Y-%b-%d-%H-%M-%S}]

send "_$date.cfg\r"

expect "$*#"
send "logout\r"

expect eof