# Tugas 3 Keamanan Jaringan 
---
Tutorial ini menggunakan **Ubuntu Server 18.04.1 LTS** yang di koneksikan via _**Secure Shell**_ atau _**SSH**_.
Tutorial ini menjelaskan tentang installasi **SNORT** yang merupakan tools _**Nertwork Intrusion Detection & Prevention System**_.
Tutorial ini menjelaskan tentang installasi _Dependencies_ yang dibutuhkan **SNORT** pada saat installasi ataupun _Runtime_.

### Table of Content
1. [Installasi Snort](#installasi-snort)
	1. [Compile Manual Source Code](#compile-source-code)
	2. [Via Apt](#via-apt)
	3. Menghapus Snort
2. [Konfigurasi Snort](#pembuatan-rules-snort)

## Installasi Snort
---

### Compile Source Code
1. Koneksikan server anda dengan `SSH`. server ini menggunakan:
    ```
    $ ssh sysadmin@192.168.1.10
    ```
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/1.0.png)
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/2.0.png)
2. Buat Folder sementara untuk Source Code Snort dan Dependencies nya:
    ```
    $ mkdir SnortInstall
    $ cd SnortInstall
    ```
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/3.0.png)
3. Install Dependencies berikut dengan `apt` atau `apt-get` :
    ```
    $ sudo apt-get install libpcap-dev libpcre3 libpcre3-dev libdumbnet-dev zlib1g-dev bison flex
    $ sudo apt-get install gcc g++ bison flex make
    ```
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/4.2.png)
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/4.3.png)
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/4.4.png)
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/4.5.png)
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/4.1.png)
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/4.0.png)
4. Download Tarball Source Code `Snort` dan `daq`:
    ```
    $ wget https://www.snort.org/downloads/snort/daq-2.0.6.tar.gz
    $ wget https://www.snort.org/downloads/snort/snort-2.9.11.1.tar.gz
    ```
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/5.0.png)
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/5.1.png)
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/5.2.png)
5. Untar kedua tarball Source Code tersebut :
    ```
    $ tar xvzf daq-2.0.6.tar.gz
    $ tar xvzf snort-2.9.11.1.tar.gz
    ```
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/6.0.png)
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/6.1.png)
6. Konfigurasi Source Code `daq` dengan:
    ```
    $ cd daq-2.0.6/
    $ ./configure
    ```
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/7.0.png)
7. Re-Compile Source Code `daq` dengan `make`:
    ```
    $ make
    ```
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/8.0.png)
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/8.1.png)
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/8.2.png)
8. Compile dan Installasikan `daq` :
    ```
    $ sudo make install
    ```
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/9.0.png)
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/9.1.png)
9. Pindah ke Direktori Source Code `Snort`:
    ```
    $ cd ..
    $ cd snort-2.9.11.1/
    ```
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/10.png)
10. Konfigurasikan Source Code `Snort`:
    ```
    $ ./configure --enable-sourcefire
    ```
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/11.0.png)
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/11.1.png)
11. Re-Compile Source Code `Snort`:
    ```
    $ make
    ```
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/12.0.png)
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/12.1.png)
12. Compile dan Installasikan `Snort`:
    ```
    $ sudo make install
    ```
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/13.0.png)
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/13.1.png)
13. Cek `Snort` Dengan :
    ```
    $ snort --version
    ```
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/FinalSnortVersion.png)

### Via Apt
1. Install `Snort` Dependencies:
    ```
    $ sudo apt-get install gcc g++ libpcap-dev libpcre3 libpcre3-dev libdumbnet-dev zlib1g-dev bison flex
    ```
    ![]()
2. Install `Snort`:
    ```
    $ sudo apt-get install snort
    ```
    ![]()
3. Cek `Snort` Dengan:
    ```
    $ snort --version
    ```
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Kamdat/Tugas%203/FinalSnortVersion.png)
    
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
