##Switch Backuper

Scripts support backup following models of hardware.

### Allied Telesis
* at-8000
* at-8024
* at-8350
* at-8624
* at-8550 (ATS62)
* at-9410

### D-link
* dgs-3024

### Cisco
* all hardware with classic ISO syntax

###Requirements:

* [expect](http://ru.wikipedia.org/wiki/Expect)
* [tftpd](http://ru.wikipedia.org/wiki/TFTP)

###Notation

at-8350 need preconfig

Configuration File Upload/Download -> TFTP Configuration File Upload/Download

Propertis           | Value
--------------------|:-------:
TFTP Server IP:     |ip_address
Config File Name:   |folder/config_name.cfg