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

sudo apt install wget #in case it's not already installed
wget https://github.com/bharadwaj-raju/WeatherDesk/archive/master.tar.gz -O /tmp/weatherdesk.tar.gz
tar -xvf /tmp/weatherdesk.tar.gz -C /tmp/
sudo mkdir /opt/weatherdesk
sudo cp /tmp/WeatherDesk-master/*.py /opt/weatherdesk/
sudo chmod +x /opt/weatherdesk/WeatherDesk.py
sudo ln -s /opt/weatherdesk/WeatherDesk.py /usr/local/bin/weatherdesk
mkdir ~/.weatherdesk_walls
wget https://github.com/bharadwaj-raju/FireWatch-WeatherDesk-Pack/archive/master.tar.gz -O /tmp/firewatchpack.tar.gz
tar -xvf /tmp/firewatchpack.tar.gz -C ~/.weatherdesk_walls/ --strip-components=1