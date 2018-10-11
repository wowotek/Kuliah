![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/Installasi/sourcecode/doc_logo.png)
# Tugas 3 Keamanan Jaringan 
---
Tutorial ini menggunakan **Ubuntu Server 18.04.1 LTS** yang di koneksikan via _**Secure Shell**_ atau _**SSH**_.
Tutorial ini menjelaskan tentang installasi **SNORT** yang merupakan tools _**Nertwork Intrusion Detection & Prevention System**_.
Tutorial ini menjelaskan tentang installasi _Dependencies_ yang dibutuhkan **SNORT** pada saat installasi ataupun _Runtime_.

### Table of Content
1. [Instalasi Snort](#instalasi-snort)
	1. [Compile Manual Source Code](#compile-source-code)
	2. [Via Apt](#via-apt)
	3. [Konfigurasi Snort](#konfigurasi-snort)
	    - [Konfigurasi Instalasi Apt](#konfigurasi-instalasi-apt)
	    - [Konfigurasi Instalasi manual](#konfigurasi-instalasi-manual)
	4. [Menghapus Snort](#menghapus-snort)
2. [Pembuatan Rules Snort](#pembuatan-rules-snort)
    1. [Ping Alert Rules](#ping-alert-rules)
    2. [TCP Alert Rules](#tcp-alert-rules)
    3. [UDP Alert Rules](#udp-alert-rules)
3. [Test Snort](#test-snort)
    1. [Test Ping Alert](#test-ping-alert-rules)
    2. [Test TCP Alert](#test-tcp-alert-rules)
    3. [Test UDP Alert](#test-udp-alert-rules)

## Instalasi Snort
---

### Compile Source Code
1. Koneksikan server anda dengan `SSH`. server ini menggunakan:
    ```
    $ ssh sysadmin@192.168.1.10
    ```
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/Installasi/sourcecode/1.0.png)
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/Installasi/sourcecode/2.0.png)
2. Buat Folder sementara untuk Source Code Snort dan Dependencies nya:
    ```
    $ mkdir SnortInstall
    $ cd SnortInstall
    ```
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/Installasi/sourcecode/3.0.png)
3. Install Dependencies berikut dengan `apt` atau `apt-get` :
    ```
    $ sudo apt-get install libpcap-dev libpcre3 libpcre3-dev libdumbnet-dev zlib1g-dev bison flex
    $ sudo apt-get install gcc g++ bison flex make
    ```
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/Installasi/sourcecode/4.2.png)
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/Installasi/sourcecode/4.3.png)
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/Installasi/sourcecode/4.4.png)
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/Installasi/sourcecode/4.5.png)
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/Installasi/sourcecode/4.1.png)
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/Installasi/sourcecode/4.0.png)
4. Download Tarball Source Code `Snort` dan `daq`:
    ```
    $ wget https://www.snort.org/downloads/snort/daq-2.0.6.tar.gz
    $ wget https://www.snort.org/downloads/snort/snort-2.9.11.1.tar.gz
    ```
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/Installasi/sourcecode/5.0.png)
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/Installasi/sourcecode/5.1.png)
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/Installasi/sourcecode/5.2.png)
5. Untar kedua tarball Source Code tersebut :
    ```
    $ tar xvzf daq-2.0.6.tar.gz
    $ tar xvzf snort-2.9.11.1.tar.gz
    ```
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/Installasi/sourcecode/6.0.png)
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/Installasi/sourcecode/6.1.png)
6. Konfigurasi Source Code `daq` dengan:
    ```
    $ cd daq-2.0.6/
    $ ./configure
    ```
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/Installasi/sourcecode/7.0.png)
7. Re-Compile Source Code `daq` dengan `make`:
    ```
    $ make
    ```
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/Installasi/sourcecode/8.0.png)
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/Installasi/sourcecode/8.1.png)
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/Installasi/sourcecode/8.2.png)
8. Compile dan Installasikan `daq` :
    ```
    $ sudo make install
    ```
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/Installasi/sourcecode/9.0.png)
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/Installasi/sourcecode/9.1.png)
9. Pindah ke Direktori Source Code `Snort`:
    ```
    $ cd ..
    $ cd snort-2.9.11.1/
    ```
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/Installasi/sourcecode/10.png)
10. Konfigurasikan Source Code `Snort`:
    ```
    $ ./configure --enable-sourcefire
    ```
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/Installasi/sourcecode/11.0.png)
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/Installasi/sourcecode/11.1.png)
11. Re-Compile Source Code `Snort`:
    ```
    $ make
    ```
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/Installasi/sourcecode/12.0.png)
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/Installasi/sourcecode/12.1.png)
12. Compile dan Installasikan `Snort`:
    ```
    $ sudo make install
    ```
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/Installasi/sourcecode/13.0.png)
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/Installasi/sourcecode/13.1.png)
13. Manage dan install _**shared libraries**_:
    ```
    $ sudo ldconfig
    ```
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/konfigurasi_manual/ldconf.png)
14. Buat user khusus untuk `Snort` :
    ```
    $ sudo groupadd snort
    $ sudo useradd snort -r -s /sbin/nologin -c SNORT_IDS -g snort
    ```
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/konfigurasi_manual/useradd.png)
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/konfigurasi_manual/groupadd.png)
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/konfigurasi_manual/usergroupcheck.png)
15. Buat `Snort` _System Directory_ :
    ```
    $ sudo mkdir /etc/snort
    $ sudo mkdir /etc/snort/rules
    $ sudo mkdir /etc/snort/rules/iplists
    $ sudo mkdir /etc/snort/preproc_rules
    $ sudo mkdir /usr/local/lib/snort_dynamicrules
    $ sudo mkdir /etc/snort/so_rules
    ```
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/konfigurasi_manual/adddir.png)
16. Buat _Placeholder_ file untuk rules dan iplist:
    ```
    $ sudo touch /etc/snort/rules/iplists/black_list.rules
    $ sudo touch /etc/snort/rules/iplists/white_list.rules
    $ sudo touch /etc/snort/rules/local.rules
    $ sudo touch /etc/snort/sid-msg.map
    ```
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/konfigurasi_manual/placeconf.png)
17. Buat _Placeholder_ file untuk log `Snort`:
    ```
    $ sudo mkdir /var/log/snort
    $ sudo mkdir /var/log/snort/archived_logs
    ```
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/konfigurasi_manual/placelog.png)
18. Pindah ke File Source Code Snort:
    ```
    $ cd SnortInstall/snort-2.9.11.1/etc/
    ```
19. _Copy_ file konfigurasi ke folder lokal:
    ```
    $ sudo cp *.conf* /etc/snort
    $ sudo cp *.map /etc/snort
    $ sudo cp *.dtd /etc/snort
    ```
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/konfigurasi_manual/cpdata.png)
20. _Copy_ dynamic preprocessor ke folder lokal `Snort`:
    ```
    $ cd ../src/dynamic-preprocessors/build/usr/local/lib/snort_dynamicpreprocessor/
    $ sudo cp * /usr/local/lib/snort_dynamicpreprocessor/
    $ cd
    ```
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/konfigurasi_manual/cpdynamic.png)
21. Cek Keberhasilan Installasi `Snort` Dengan :
    ```
    $ snort --version
    ```
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/Installasi/FinalSnortVersion.png)
22. Konfigurasikan `Snort` sesuai dengan [Konfigurasi Instalasi Manual](#konfigurasi-instalasi-manual)

### Via Apt
1. Install `Snort` Dependencies:
    ```
    $ sudo apt-get install gcc g++ libpcap-dev libpcre3 libpcre3-dev libdumbnet-dev zlib1g-dev bison flex
    ```
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/Installasi/apt/install_dep.png)
2. Install `Snort`:
    ```
    $ sudo apt-get install snort
    ```
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/Installasi/apt/install_apt_1.png)
3. Konfigurasikan sesuai dengan [Konfigurasi Instalasi apt](#konfigurasi-instalasi-apt)

### Konfigurasi `Snort`
#### Konfigurasi Instalasi apt
1. Cek network interface anda dengan `ifconfig`
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/konfigurasi_apt/server_interface.png)
2. Ganti Interface anda sesuai dengan interface network
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/konfigurasi_apt/resetting_interface.png)
3. Ganti IP range sesuai dengan ip server
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/konfigurasi_apt/ip_server.png)
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/konfigurasi_apt/resetting_ip.png)
#### Konfigurasi Instalasi Manual
1. **_incomment_** semua ruleset dalam `snort.conf` lalu edit konfigurasi `snort`:
    ```
    $ sudo sed -i "s/include \$RULE\_PATH/#include \$RULE\_PATH/" /etc/snort/snort.conf
    $ sudo vim /etc/snort/snort.conf
    ```
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/konfigurasi_manual/incomment.png)
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/konfigurasi_manual/vim.png)
2. Konfigurasikan `HOME_NET` anda dengan ip yang ingin di proteksi:
    - cek ip anda dengan `ifconfig`; dengan server ini mendapat ip : `192.168.1.10` maka CIDR nya adalah `192.168.1.0/24`
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/konfigurasi_manual/netint.png)
    - lalu ubah line berikut:
        ```
        # Setup the network addresses you are protecting
        ipvar HOME_NET any
        ```
        menjadi :
        ```
        # Setup the network addresses you are protecting
        ipvar HOME_NET 192.168.1.0/24
        ```
        ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/konfigurasi_manual/ip_changes.png)
3. konfigurasikan folder rule:
    - arahkan ke line berikut dengan menekan: `esc` + `/` + `c:\\`
    - lalu ubah line berikut :
        ```
        # such as:  c:\snort\rules
        var RULE_PATH ../rules
        var SO_RULE_PATH ../so_rules
        var PREPROC_RULE_PATH ../preproc_rules
        
        # If you are using reputation preprocessor set these
        var WHITE_LIST_PATH ../rules
        var BLACK_LIST_PATH ../rules
        ```
        ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/konfigurasi_manual/var.png)
        dengan :
        ```
        # such as:  c:\snort\rules
        var RULE_PATH /etc/snort/rules
        var SO_RULE_PATH /etc/snort/so_rules
        var PREPROC_RULE_PATH /etc/snort/preproc_rules
        var WHITE_LIST_PATH /etc/snort/rules/iplists
        var BLACK_LIST_PATH /etc/snort/rules/iplists
        ```
        ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/konfigurasi_manual/var_change.png)
4. include rules lokal:
    - arahkan ke line berikut dengan menekan: `esc` + `/` + `site specific`
    - lalu ubah line berikut :
        ```
        # site specific rules
        #include $RULE_PATH/local.rules
        ```
        menjadi :
        ```
        # site specific rules
        include $RULE_PATH/local.rules
        ```
        ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/konfigurasi_manual/include_change.png)
5. save dan keluar vim dengan : `esc` + `:` + `wq` + `enter`
6. Verifikasi setting konfigurasi snort dengan :
    ```
    $ sudo snort -T -i enp1s0 -c /etc/snort/snort.conf
    ```
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/konfigurasi_manual/test.png)
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/konfigurasi_manual/finished.png)
### Menghapus `Snort`
- Jika anda menggunakan Source Code:
    1. Pindahkan Working Directory ke folder Source Code `snort` :
        ```
        $ cd ~/SnortInstall/snort-2.9.11.1/
        ```
    2. Delete installasi `snort` dengan :
        ```
        $ make uninstall
        ```
    3. Pindahkan Working Directory ke folder Source Code `daq` :
        ```
        $ cd ~/SnortInstall/daq-2.0.6/
        ```
    4. Delete installasi `daq` dengan:
        ```
        $ make uninstall
        ```
    5. Delete Dependencies Lanjutan `snort` dengan:
        ```
        sudo apt-get remove --purge libpcap-dev libpcre3 libpcre3-dev libdumbnet-dev zlib1g-dev bison flex gcc g++ bison flex make
        ```
- Jika menggunakan `apt`:
    1. Hapus installasi `snort` :
        ```
        $ sudo apt-get remove --purge snort
        ```
    2. Hapus Dependencies `snort` :
        ```
        $ sudo apt-get remove --purge gcc g++ libpcap-dev libpcre3 libpcre3-dev libdumbnet-dev zlib1g-dev bison flex
        ```
        
## Pembuatan Rules Snort
---
### Ping Alert Rules
1. `ssh` ke server:
    ```
    $ ssh sysadmin@192.168.1.10
    ```
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/test_snort/ssh.png)
2. buka konfigurasi snort dengan `vim` atau `nano` lalu arahkan ke `ipvar HOME_NET ~`:
    ```
    $ sudo vim /etc/snort/snort.conf
    ```
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/test_snort/arahip.png)
3. ubah ip menjadi ip lokal server:
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/test_snort/ubahip.png)
4. comment rules `local.rules`:
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/test_snort/commentrules.png)
5. lalu arahkan ke line paling ujung dan tambahkan :
    ```
    include $RULE_PATH/pingalert.rules
    ```
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/test_snort/addrules.png)
6. save dan keluar dari editor
7. buat dan edit file yang baru ditambahkan yaitu `pingalert.rules` menggunakan `tee` atau `vim`:
    ```
    $ sudo tee /etc/snort/rules/pingalert.rules
    $ sudo vim /etc/snort/rules/pingalert.rules
    ```
    atau
    ```
    $ sudo vim /etc/snort/rules/pingalert.rules
    ```
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/test_snort/newfilerule.png)
8. buat rules yang mendeteksi ping dari client ke server:
    ```
    alert icmp 192.168.1.8 any -> 192.168.1.10 any (msg:"PING RECEIVED"; sid:1;)
    ```
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/test_snort/ruleadds.png)
9. simpan lalu keluar
10. Cek dengan [tail](#test-ping-alert-rules)

### TCP Alert Rules
1. buat dan edit file rules baru:
    ```
    $ sudo vim /etc/snort/rules/tcpalert.rules
    ```
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/test_rule_tcp/newfile.png)
2. tambah 2 rules berikut :
    ```
    alert tcp 192.168.1.8 any -> 192.168.1.10 22 (msg: "SSH Packet found"; sid:2; )
    alert tcp 192.168.1.8 any -> 192.168.1.10 80 (msg: "HTTP Packet found"; sid:3; )
    ```
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/test_rule_tcp/addrule.png)
3. tambahkan rules ke dalam konfigurasi `snort`:
    ```
    $ sudo vim /etc/snort/snort.conf
    ```
    tambahkan
    ```
    include $RULE_PATH/tcpalert.rules
    ```
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/test_rule_tcp/tambahkonfig.png)
4. cek menggunakan [tail](#test-tcp-alert-rules)

### UDP Alert Rules
1. buat dan edit file rules baru:
    ```
    $ sudo vim /etc/snort/rules/udpalert.rules
    ```
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/test_rule_udp/newfile.png)
2. tambah 1 rules berikut :
    ```
    alert udp 192.168.1.8 any -> 192.168.1.10 3000 (msg: "UDP Packet found"; sid:4; )
    ```
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/test_rule_udp/newrule.png)
3. tambahkan rules ke dalam konfigurasi `snort`:
    ```
    $ sudo vim /etc/snort/snort.conf
    ```
    Comment 2 rules sebelumnya lalu tambahkan
    ```
    include $RULE_PATH/udpalert.rules
    ```
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/test_rule_udp/addrule.png)
4. cek menggunakan [tail](#test-udp-alert-rules)

## Test Snort
---
1. buka terminal baru
2. jalankan `tail` ke file alert `snort` pada terminal baru:
    ```
    $ tail -F /var/log/snort/alert
    ```
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/test_snort/runtail.png)
3. jalankan snort pada terminal lama:
    ```
    $ sudo snort -v -i enp1s0 -c /etc/snort/snort.conf
    ```
    
### Test Ping Alert Rules
1. Pada **_CLIENT_** buka terminal
2. lalu Ping ke server menggunakan ip server:
    ```
    $ ping 192.168.1.10 -c 3
    ```
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/test_snort/FINAL.png)

### Test TCP Alert Rules
1. Pada **_CLIENT_** buka terminal
2. lalu ssh ke server
    ```
    $ ssh sysadmin@192.168.1.10
    ```
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/test_rule_tcp/ssh.png)
3. Pada **_CLIENT_** buka _browser_
4. Masukan IP server kedalam browser menggunakan protokol http:
    ```
    http://192.168.1.10
    ```
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/test_rule_tcp/ipbrowser.png)
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/test_rule_tcp/http.png)
    
### Test UDP Alert Rules
1. Pada **_CLIENT_** buka terminal
2. lalu kirimkan pake udp ke server menggunakan `echo`:
    ```
    $ echo "This is my data" > /dev/udp/192.168.1.10/3000
    ```
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/test_rule_udp/FINAL.png)
