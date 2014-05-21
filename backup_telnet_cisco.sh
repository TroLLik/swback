#!/usr/bin/expect -f

if {[llength $argv] != 4} {
	puts "Run: ./backup_telnet_cisco.sh <host> <login> <password>"
	exit 1
}

set timeout 2

set host [lindex $argv 0]
set log [lindex $argv 1]
set pas [lindex $argv 2]
set srv [lindex $argv 3]

spawn telnet $host
expect "Username:"
send "$log\r"

expect "Password:"
send "$pas\r"

expect "$*>"
send "enable\r"

expect "Password:" {
send "$pas\r"}

expect "$*#"
send "copy startup-config tftp://$srv/reg/$host"

set now [clock seconds]
set date [clock format $now -format {%Y-%b-%d-%H-%M-%S}]

send "_$date.cfg\r"

expect "$*?"
send "\r"

expect "$*?"
send "\r"

expect "$*#"
send "exit\r"

expect eof