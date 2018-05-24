main() {
    echo "  Memperbaharui Tabel Repository"
    apt-get update
    apt-get install software-properties-common
    clear

    echo "  Menambahkan Software Repository"
    sudo add-apt-repository multiverse
    add-apt-repository ppa:webupd8team/java
    add-apt-repository ppa:webupd8team/atom
    add-apt-repository ppa:vajdics/netbeans-installer
    add-apt-repository ppa:otto-kesselgulasch/gimp
    add-apt-repository ppa:deadsnakes/ppa
    add-apt-repository ppa:libreoffice/ppa
    add-apt-repository ppa:mystic-mirage/pycharm
    add-apt-repository ppa:damien-moore/codeblocks-stable
    wget -O getdebplay.deb archive.getdeb.net/install_deb/playdeb_0.3-1~getdeb1_all.deb
    wget -O getdebapps.deb archive.getdeb.net/install_deb/getdeb-repository_0.1-1~getdeb1_all.deb
    echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.lis
    clear

    echo "  Menambahkan Authentication Key Repository"
    wget -O getdebkey http://archive.getdeb.net/getdeb-archive.key | sudo apt-key add getdebkey
    wget -O oraclevboxkey.asc https://www.virtualbox.org/download/oracle_vbox.asc | sudo apt-add oraclevboxkey.asc
    wget -O chromekey https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add chromekey
    clear

    echo "  Memperbaharui Ulang Table Repository"
    echo "  Prompt: GetDeb-apps"
    dpkg -i getdebapps.deb
    apt-get install -f
    clear

    echo "  Prompt: GetDeb-play"
    dpkg -i getdebplay.deb
    apt-get install -f
    clear

    apt-get update
    clear

    echo "  Menginstall Aplikasi"
    echo "  -> Menginstall Dev Tools"
    apt-get install git vim git-cola meld
    clear

    echo "  -> Menginstall CodeBlock"
    apt-get install codeblocks
    clear

    echo "  -> Menginstall Python 3.6"
    apt-get install python3.6
    pip install --upgrade pip
    pip3 install --upgrade pip3
    pip install --upgrade pip3
    pip3 install --upgrade pip
    clear
    
    echo "  -> Menginstall Notepadqq"
    snap install notepadqq
    clear

    echo "  -> Menginstall Libre Office"
    apt-get install libreoffice
    clear

    echo "  -> Menginstall Atom"
    apt-get install atom
    clear

    echo "  -> Menginstall Java"
    apt-get install oracle-java8-set-default
    clear

    echo "  -> Menginstall SQL Devel Pack"
    apt-get install sqldeveloper-package
    clear
    
    echo "  -> Menginstall Pycharm"
    apt-get install pycharm-community

    echo "  -> Menginstall Netbeans"
    apt-get install netbeans-installer
    clear
    
    echo "  -> Menginstall VirtualBox"
    apt-get install virtualbox-5.0 --fix-missing
    clear 

    echo "  -> Menginstall GIMP"
    apt-get install gimp
    clear

    echo "  -> Menginstall VLC"
    apt-get install vlc
    clear

    echo "  -> Menginstall Chrome"
    apt-get install google-chrome-stable
    clear

    echo "  -> Menginstall Steam"
    apt-get install steam
    clear

    echo "  -> Menginstall FFMPEG"
    apt-get install ffmpeg
    clear
    
    echo "  -> Menginstall xampp"
    wget https://www.apachefriends.org/xampp-files/5.6.20/xampp-linux-x64-5.6.20-0-installer.run
    chmod +x xampp-linux-x64-5.6.20-0-installer.run
    ./xampp-linux-x64-5.6.20-0-installer.run
    clear

    echo "Merapihkan File Installasi"
    echo "  Prompt: SQL Devel Pack"
    make-sqldeveloper-package -b output sqldeveloper*.zip
    dpkg -i sqldeveloper*all.deb
    clear
}

echo "Yakin Menginstall Lingkungan Kuliah di Linux Ini ?"
