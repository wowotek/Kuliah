# Praktikum Kamjar
---
### Syarat

- FTP Server Ubuntu
- 2 Client
- Rule pada Shorewall
- 4 Screenshoot dan beri penjelasan
- Ketentuan :
    - Subjek :
    	`kamjar_shorewall_nimketua`
    - File Type :
    	`PDF`
    - Email Ke :
    	`dhimaswiharjo@gmail.com`

### Implementasi Syarat :
- FTP Server Menggunakan _`vsftpd`_ pada Ubuntu Server 16.04.5
- 2 Client :
	- Ubuntu Server 18.04.1 @ 192.168.1.10
	- Ubuntu Desktop (Host) 18.04.1 @ 192.168.1.7
- Rule Pada Shorewall

## Installasi dan Konfigurasi Shorewall
---
- Buka Dua Terminal
- Pakai 1 Terminal untuk SSH ke Client 2 :
	```
	$ ssh sysadmin@192.168.1.10
	```
- Buka Server Utama pada Virtual Box
	```
	$ virtualbox --startvm ubuntu-server
	```
- install shorewall menggunakan _`apt`_ :
	```
	$ sudo apt-get install shorewall
	```
- rubah syarat startup menjadi `1`:
	```
	$ sudo vim /etc/default/shorewall
	```
- ubah konfigurasi _zones_ :
	```
	$ sudo vim /etc/shorewall/zones
	```
	menjadi
	```
	fw firewall
	loc ipv4
	```
- ubah konfigurasi _network interface_ :
	```
	$ sudo vim /etc/shorewall/interfaces
	```
	menjadi
	```
	loc enp0s3 detect dhcp
	```
- ubah konfigurasi _policy_ :
	```
	$ sudo vim /etc/shorewall/policy
	```
	menjadi
	```
	loc all REJECT
	fw all ACCEPT
	all all REJECT
	```
- ubah konfigurasi _rules_ :
	```
	$ sudo vim /etc/shorewall/rules
	```
	menjadi
	```
	Ping(ACCEPT) loc:192.168.1.10 fw
	Ping(REJECT) loc:192.168.1.7 fw
	```
- Turn On _Ip Forwading_ :
	```
	$ sudo vim /etc/shorewall/shorewall.conf
	```
	ubah line 174 menjadi
	```
	# IP_FORWADING=Keep
	IP_FORWADING=On
	```
- Check Konfigurasi :
	```
	$ sudo shorewall check
	```
- Jalankan Shorewall :
	```
	$ sudo shorewall start
	```
- Test Konfigurasi Dengan Ping ke Virtual Server @ 192.168.1.14 Pada Kedua Client :
	```
	$ ping 192.168.1.14
	```

## Installasi FTP Server
---
- Install `vsftpd` via apt:
  ```
  $ sudo apt update
  $ sudo apt install vsftpd
  ```
- backup configurasi default vsftp:
  ```
  $ sudo cp /etc/vsftpd.conf /etc/vsftpd.conf.bak
  ```
- tambahkan shorewall berikut :
  ```
  $ sudo vim /etc/shorewall/rules
  ```
  tambahkan
  ```
  FTP(ACCEPT) loc fw
  ```
- restart shorewall :
  ```
  $ sudo shorewall restart
  ```
- test koneksi pada kedua client :
  ```
  $ ftp -n 192.168.1.14
  ```
- ubah konfigurasi shorewall menjadi :
  ```
  FTP(ACCEPT) 
  ```
  lalu restart shorewall
- test pada kedua client :
