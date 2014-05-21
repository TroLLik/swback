#!/bin/bash

#switch backuper v0.1

#secret
log='<your user name>'
pas='<your password>'
srv='<tftp server name>'
#for ATS62, at-8024 and dgs-3024 like only
srvip='<tftp server ip address>'

#telent at-8000 like syntax
for host in '<switch1>' '<switch2>' '<switch3>'
do
expect -f ./backup_telnet_at8000s.sh $host $log $pas $srv #> /dev/null
done

#telent at-8624 like syntax
for host in '<switch1>' '<switch2>' '<switch3>'
do
expect -f ./backup_telnet_at8624.sh $host $log $pas $srv #> /dev/null
done

#ssh at-8624 like syntax
for host in '<switch1>' '<switch2>' '<switch3>'
do
expect -f ./backup_ssh_at8624.sh $host $log $pas $srv #> /dev/null
done

#telnet cisco like syntax
for host in '<switch1>' '<switch2>' '<switch3>'
do
expect -f ./backup_telnet_cisco.sh $host $log $pas $srv #> /dev/null
done

#telnet at-8350 at-9410 like syntax
#need switch preconfig (tftp server)
for host in '<switch1>' '<switch2>' '<switch3>'
do
expect -f ./backup_telnet_at8350.sh $host $log $pas #> /dev/null
done

#telnet at-8550GB ATS62 like syntax
#for ATS62 like switch in $srvip must be ip address only (no host name)
for host in '<switch1>' '<switch2>' '<switch3>'
do
expect -f ./backup_telnet_at8550.sh $host $log $pas $srvip #> /dev/null
done

#telnet dgs-3024 like syntax
#for dgs-3024 like switch in $srvip must be ip address only (no host name)
for host in '<switch1>' '<switch2>' '<switch3>'
do
expect -f ./backup_telnet_dgs-3024.sh $host $log $pas $srvip #> /dev/null
done

#telnet at-8024 like syntax
#for at-8024 like switch in $srvip must be ip address only (no host name)
for host in '<switch1>' '<switch2>' '<switch3>'
do
expect -f ./backup_telnet_at8024.sh $host $log $pas $srvip #> /dev/null
done