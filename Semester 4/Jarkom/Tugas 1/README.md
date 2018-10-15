![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Jarkom/Tugas%201/Logo.png)
# Installasi Cisco Packet Tracer
---

1. Unduh dan Install Dependencies Cisco Packet Tracer (CPT):
    ```
    $ sudo apt update
    $ sudo apt install qtmultimedia5-dev libqt5scripttools5 libqt5webkit5 libqt5multimedia5 libqt5printsupport5 libqt5script5 libgpg-error-dev libbsd-dev libssl-dev
    ```
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Jarkom/Tugas%201/Installasi/apt.png)
2. Unduh Tarball CPT di:
    - Melalui Link :
      [ComputerNetworkingNotes](https://archive.org/download/pt711/PacketTracer7.1.1ForLinux64Bit.tar)
    - Melalui Console :
        ```
        $ mkdir CPT
        $ cd CPT
        $ wget https://archive.org/download/pt711/PacketTracer7.1.1ForLinux64Bit.tar
        ```
        ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Jarkom/Tugas%201/Installasi/1.0.png)
3. Un-Tar Tarbal CPT:
    ```
    $ sudo tar xvzf PacketTracer7.1.1ForLinux64Bit.tar
    ```
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Jarkom/Tugas%201/Installasi/2.0.png)
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Jarkom/Tugas%201/Installasi/2.1.png)
4. Run Install Script:
    ```
    $ sudo ./install
    ```
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Jarkom/Tugas%201/Installasi/3.0.png)
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Jarkom/Tugas%201/Installasi/3.1.png)
    ![](https://raw.githubusercontent.com/wowotek/Kuliah/master/Semester%204/Jarkom/Tugas%201/Installasi/FINAL.png)
5. Restart Komputer :
    ```
    $ sudo systemctl reboot
    ```
    atau
    ```
    $ sudo reboot
    ```
7. Buat Shortcut atau Symbolic Link ke SYSTEM PATH :
    ```
    $ sudo ln -s /opt/pt/bin/PacketTracer7 /usr/bin/PacketTracer7
    ```
6. Jalankan Packet Tracer :
    ```
    $ PacketTracer7
    ```
    atau
    ```
    $ /opt/pt/bin/PacketTracer7
    ```
