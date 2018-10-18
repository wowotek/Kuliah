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
  ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamjar/Tugas%20Praktikum%201/Installasi/1.png)
- Pakai 1 Terminal untuk SSH ke Client 2 :
  ```
  $ ssh sysadmin@192.168.1.10
  ```
  ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamjar/Tugas%20Praktikum%201/Installasi/2.png)
- Buka Server Utama pada Virtual Box
  ```
  $ virtualbox --startvm ubuntu-server
  ```
  ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamjar/Tugas%20Praktikum%201/Installasi/3.png)
- install shorewall menggunakan _`apt`_ :
  ```
  $ sudo apt-get install shorewall
  ```
  ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamjar/Tugas%20Praktikum%201/Installasi/4.png)
- rubah syarat startup menjadi `1`:
  ```
  $ sudo vim /etc/default/shorewall
  ```
  ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamjar/Tugas%20Praktikum%201/Installasi/5.png)
  ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamjar/Tugas%20Praktikum%201/Installasi/6.png)
  enable shore wall
  ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamjar/Tugas%20Praktikum%201/Installasi/7.png)
- ubah konfigurasi _zones_ :
  ```
  $ sudo vim /etc/shorewall/zones
  ```
  menjadi
  ```
  fw firewall
  loc ipv4
  ```
  ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamjar/Tugas%20Praktikum%201/Installasi/8.png)
- ubah konfigurasi _network interface_ :
  ```
  $ sudo vim /etc/shorewall/interfaces
  ```
  ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamjar/Tugas%20Praktikum%201/Installasi/9.png)
  menjadi
  ```
  loc enp0s3 detect dhcp
  ```
  ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamjar/Tugas%20Praktikum%201/Installasi/10.png)
- ubah konfigurasi _policy_ :
  ```
  $ sudo vim /etc/shorewall/policy
  ```
  ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamjar/Tugas%20Praktikum%201/Installasi/11.png)
  menjadi
  ```
  loc all REJECT
  fw all ACCEPT
  all all REJECT
  ```
  ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamjar/Tugas%20Praktikum%201/Installasi/12.png)
- ubah konfigurasi _rules_ :
  ```
  $ sudo vim /etc/shorewall/rules
  ```
  ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamjar/Tugas%20Praktikum%201/Installasi/13.png)
  menjadi
  ```
  Ping(ACCEPT) loc:192.168.1.10 fw
  Ping(REJECT) loc:192.168.1.7 fw
  ```
  ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamjar/Tugas%20Praktikum%201/Installasi/14.png)
- Kosongkan konfigurasi masq:
  ```
  $ sudo vim /etc/shorewall/masq
  ```
  ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamjar/Tugas%20Praktikum%201/Installasi/15.png)
  ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamjar/Tugas%20Praktikum%201/Installasi/16.png)
- Turn On _Ip Forwading_ :
  ```
  $ sudo vim /etc/shorewall/shorewall.conf
  ```
  ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamjar/Tugas%20Praktikum%201/Installasi/17.png)
  ubah line 174 menjadi
  ```
  # IP_FORWADING=Keep
  IP_FORWADING=On
  ```
  ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamjar/Tugas%20Praktikum%201/Installasi/18.png)
- Check Konfigurasi :
  ```
  $ sudo shorewall check
  ```
  ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamjar/Tugas%20Praktikum%201/Installasi/19.png)
- Jalankan Shorewall :
  ```
  $ sudo shorewall start
  ```
  ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamjar/Tugas%20Praktikum%201/Installasi/20.png)
- Test Konfigurasi Dengan Ping ke Virtual Server @ 192.168.1.14 Pada Kedua Client :
  ```
  $ ping 192.168.1.14
  ```
  ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamjar/Tugas%20Praktikum%201/Installasi/21.png)

## Installasi FTP Server
---
- Install `vsftpd` via apt:
  ```
  $ sudo apt update
  $ sudo apt install vsftpd
  ```
  ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamjar/Tugas%20Praktikum%201/Konfigurasi/1.png)
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
  ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamjar/Tugas%20Praktikum%201/Konfigurasi/2.png)
- restart shorewall :
  ```
  $ sudo shorewall restart
  ```
  ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamjar/Tugas%20Praktikum%201/Konfigurasi/3.png)
- test koneksi pada kedua client :
  ```
  $ ftp -n 192.168.1.14
  ```
  ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamjar/Tugas%20Praktikum%201/Konfigurasi/4.png)
- ubah konfigurasi shorewall menjadi :
  ```
  FTP(ACCEPT) loc:192.168.1.10 fw
  FTP(REJECT) loc:192.168.1.7 fw
  ```
  ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamjar/Tugas%20Praktikum%201/Konfigurasi/5.png)
  lalu restart shorewall
- test pada kedua client :
  ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamjar/Tugas%20Praktikum%201/Konfigurasi/FINAL.png)
