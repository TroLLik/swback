#!/usr/bin/expect -f

if {[llength $argv] != 3} {
	puts "Run: ./backup_telnet_at8350s.sh <host> <login> <password>"
	exit 1
}

set timeout 2

set host [lindex $argv 0]
set log [lindex $argv 1]
set pas [lindex $argv 2]

spawn telnet $host
expect "Login:"
send "$log\r"

expect "Password:"
send "$pas\r"

expect "Command>"
send "t"

expect "Command>"
send "c"

expect "Command>"
send "t"

# expect "Command>"
# send "f"

# expect "Enter file name>"

# send "$host"
# set now [clock seconds]
# set date [clock format $now -format {%Y-%b-%d-%H-%M-%S}]
# send "_$date.cfg\r"

expect "Command>"
send "u"

expect "Upload file (Y/N)>"
# expect *
send "y"

sleep 3
send "\r"

send "q"
send "q"
send "q"
send "q"

expect eof