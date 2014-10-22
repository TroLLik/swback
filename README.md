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

### MikroTik
* all hardware with classic MikroTik syntax

###Requirements

* [expect](http://en.wikipedia.org/wiki/Expect)
* [tftpd](http://en.wikipedia.org/wiki/Trivial_File_Transfer_Protocol)
* [ftp](http://en.wikipedia.org/wiki/File_Transfer_Protocol)

###Notation

at-8350 need preconfig

Configuration File Upload/Download -> TFTP Configuration File Upload/Download

Propertis           | Value
--------------------|:-------:
TFTP Server IP:     |ip_address
Config File Name:   |folder/config_name.cfg