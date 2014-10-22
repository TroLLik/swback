#!/usr/bin/expect -f

if {[llength $argv] != 6} {
	puts "Run: ./backup_ssh_mkrb.sh <host> <login> <password> <ftpsrv> <ftpuser> <ftppwd>"
	exit 1
}

set timeout 2

set host [lindex $argv 0]
set log [lindex $argv 1]
set pas [lindex $argv 2]
set srv [lindex $argv 3]
set ftpuser [lindex $argv 4]
set ftppwd [lindex $argv 5]

spawn ssh $log+ct@$host

expect "$*password:"
send "$pas\r"

expect "$*> "

set now [clock seconds]
set date [clock format $now -format {%Y-%b-%d-%H-%M-%S}]

send "/system backup save name=$host"
send "_$date"
send ".backup\r"

expect "$*> "
send "/export compact file=$host"
send "_$date"
send ".rsc\r"

expect "$*> "
send "/tool fetch address=$srv mode=ftp dst-path=reg/$host"
send "_$date.backup src-path=$host"
send "_$date.backup upload=yes user=$ftpuser password=$ftppwd\r"

expect "$*> "
send "/tool fetch address=$srv mode=ftp dst-path=reg/$host"
send "_$date.rsc src-path=$host"
send "_$date.rsc upload=yes user=$ftpuser password=$ftppwd\r"

expect "$*> "
send "/file remove $host"
send "_$date"
send ".backup\r"

expect "$*> "
send "/file remove $host"
send "_$date"
send ".rsc\r"

expect "$*> "
send "/quit\r"


expect eof