#!/usr/bin/expect -f

if {[llength $argv] != 4} {
	puts "Run: ./backup_telnet_at8024.sh <host> <login> <password> <tftpsrvip>"
	exit 1
}

set timeout 2

set host [lindex $argv 0]
set log [lindex $argv 1]
set pas [lindex $argv 2]
set srvip [lindex $argv 3]

spawn telnet $host
expect "Login$*"
send "$log\r"

expect "Password:"
send "$pas\r"

expect "Enter your selection?"
send "c"

expect "$*$"
send "upload method=tftp type=config\r"

expect "TFTP Server IP Address :"
send "$srvip\r"

expect "Remote File name :"
send "reg/$host"

set now [clock seconds]
set date [clock format $now -format {%Y-%b-%d-%H}]

send "_$date.cfg\r"

expect "Press any key to continue ..."
send "\r"

expect "$*$"
send "logoff\r"

expect eof