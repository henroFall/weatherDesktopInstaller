#!/bin/bash

rootCheck() {
    if ! [ $(id -u) = 0 ]
    then
        echo -e "\e[41m I am not root! Run with SUDO. \e[0m"
        exit 1
    fi
}

check_exit_status() {
    if [ $? -ne 0 ]
    then
        echo -e "\e[41m ERROR: PROCESS FAILED!"
        echo
        read -p "The last command exited with an error. Exit script? (yes/no)" answer
        if [ "$answer" == "yes" ]
        then
            echo -e "EXITING. \e[0m"
            echo
            exit 1
        fi
    fi
echo
}

####################################################

rootCheck
apt install git
check_exit_status
cd /tmp/
git clone https://gitlab.com/bharadwaj-raju/WeatherDesk.git
check_exit_status
mkdir /opt/WeatherDesk
check_exit_status
cp /tmp/WeatherDesk/*.py /opt/WeatherDesk/
check_exit_status
chmod +x /opt/WeatherDesk/WeatherDesk.py
check_exit_status
ln -s /opt/WeatherDesk/WeatherDesk.py /usr/local/bin/WeatherDesk
check_exit_status
mkdir ~/.WeatherDesk_walls
check_exit_status
wget https://github.com/bharadwaj-raju/FireWatch-WeatherDesk-Pack/archive/master.tar.gz -O /tmp/firewatchpack.tar.gz
check_exit_status
tar -xvf /tmp/firewatchpack.tar.gz -C ~/.WeatherDesk_walls/ --strip-components=1
check_exit_status
