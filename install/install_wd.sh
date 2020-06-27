#!/bin/bash
################################### STATIC BASE FUNCTIONS
rootCheck() {
    if [ $(id -u) = 0 ]
    then
        echo -e "\e[41m I am root! Run WITHOUT SUDO. \e[0m"
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
echo -e " \e[0m"
}

maximize() {
    wmctrl -r :ACTIVE: -b toggle,maximized_vert,maximized_horz
}

################################### DYNAMIC BASE FUNCTIONS
welcome() {
echo -e "                                           %%"
echo -e "                                       (@@@@@@@@"
echo -e "                                   #@@@@@@@@@@@@@@@@("
echo -e "                              #@@@@@@@@@@@@ &@@@@@@@@@@@@/"
echo -e "                        %@@@@@@@@@@@@@@         %@@@@@@@@@@@@@@("
echo -e "              @@@@@@@@@@@@@@@@@@@@         @&        @@@@@@@@@@@@@@@@@@@@#"
echo -e "              /@@@@@@@@@@@@@&            (@@@@            /@@@@@@@@@@@@@@"
echo -e "               @@@@@@%                  @@@@@@@%                 ,@@@@@@&"
echo -e "               /@@@@@@                /@@@@@@@@@@                 @@@@@@/"
echo -e "                &@@@@@@              @@@@@@@@@@@@@@              (&@@@@&"
echo -e "                 @@@@@@@           #@@@@@@@@@@@@@@@@%           @@@@@@@"
echo -e "                  @@@@@@&         @@@&@@@@@@@@@@@@&@@@         %@@@@@&"
echo -e "                  /@@@@@@&          (@@@@@@@@@@@@@@           #@@@@@@"
echo -e "                   (@@@@@@&        @@@@@@@@@@@@@@@@@%        &@@@@@&/"
echo -e "                    /@@@@@@&      @@@@@@@@@@@@@@@@@@@@,     @@@@@@@"
echo -e "                      @@@@@@@   #%%#/   #@@@@@@( (%%%%%(   @@@@@@@"
echo -e "                       &@@@@@@&         /@@@@@@#         &@@@@@@/"
echo -e "                        /@@@@@@@%        @@@@@@(       /@@@@@@@"
echo -e "                          @@@@@@@@/      %%%#((      /@@@@@@@/"
echo -e "                            @@@@@@@@/              &@@@@@@@"
echo -e "                              @@@@@@@@@         ,@@@@@@@@%"
echo -e "                                &@@@@@@@@@   (@@@@@@@@@"
echo -e "                                   @@@@@@@@@@@@@@@@@%"
echo -e "                                      @@@@@@@@@@@"
echo -e "                                          @@@/"
echo -e "                                             ("                          
echo -e " (  (                    )    )              )\\ )               )     )"        
echo -e " )\\))(   '   (     )  ( /( ( /(    (   (    (()/(     (      ( /(  ( /(              (  ("
echo -e "((_)()\\ )   ))\\ ( /(  )\\()))\\())  ))\\  )(    /(_))   ))\\ (   )\\()) )\\()) (   \`  )    )\\))("
echo -e "_(())\\_)() /((_))(_))(_))/((_)\\  /((_)(()\\  (_))_   /((_))\\ ((_)\\ (_))/  )\\  /(/(   ((_)()\\   / /"
echo -e "\\ \\((_)/ /(_)) ((_)_ | |_ | |(_)(_))   ((_)  |   \\ (_)) ((_)| |(_)| |_  ((_)((_)_\\  _(()((_) / /"
echo -e " \\ \\/\\/ / / -_)/ _\` ||  _|| ' \\ / -_) | '_|  | |) |/ -_)(_-<| / / |  _|/ _ \\| '_ \\) \\ V  V //_/"
echo -e "  \\_/\\_/  \\___|\\__,_| \\__||_||_|\\___| |_|    |___/ \\___|/__/|_\\_\\  \\__|\\___/| .__/   \\_/\\_/"
echo -e "                 (     (    (                                            )  |_|"
echo -e "                 )\\ )  )\\ ) )\\ )      (  (       (       *   )   (    ( /( "
echo -e "                (()/( (()/((()/( (    )\\))(   '  )\\    \` )  /(   )\\   )\\())"
echo -e "                 /(_)) /(_))/(_)))\\  ((_)()\\ )((((_)(   ( )(_))(((_) ((_)\\ "
echo -e "                (_))_|(_)) (_)) ((_) _(())\\_)())\\ _ )\\ (_(_()) )\\___  _((_)"
echo -e "                | |_  |_ _|| _ \\| __|\\ \\((_)/ /(_)_\\(_)|_   _|((/ __|| || |"
echo -e "                | __|  | | |   /| _|  \\ \\/\\/ /  / _ \\    | |   | (__ | __ |"
echo -e "                |_|   |___||_|_\\|___|  \\_/\\_/  /_/ \\_\\   |_|    \\___||_||_|"

}

prereq () {
sudo apt -y -qq install wmctrl
}

cleanup () {
sudo rm -R /tmp/WeatherDesk
}

################################### APP FUNCTIONS

################################### APP
echo 
rootCheck
prereq
maximize
welcome
echo
echo "Now we can optionally install the WeatherDesktop w/ FireWatch Python script from bharadwaj-raju."
echo "This script will show a different background images, based on your location, time of day, and current weather."
echo
read -p "Should I install and configure WeatherDesktop to run as a service at boot now y/n? [y]:" desktopYN
if [[ $desktopYN  == "" ]]; then desktopYN='y'
fi
if [[ $desktopYN  == "Yes" ]]; then desktopYN='y'
fi
if [[ $desktopYN  == "YES" ]]; then desktopYN='y'
fi
if [[ $desktopYN  == "yES" ]]; then desktopYN='y'
fi
if [[ $desktopYN  == "Y" ]]; then desktopYN='y'
fi
if [[ $desktopYN  == "Yes" ]]; then desktopYN='y'
fi

if [[ $desktopYN  == "y" ]]; then
sudo apt -y -qq install git
check_exit_status
cd /tmp/
echo "Cloning bharadwaj-raju's GitLab repo, all credit to bharadwaj-raju!"
git clone -q https://gitlab.com/bharadwaj-raju/WeatherDesk.git
check_exit_status
cd WeatherDesk
git clone -q https://github.com/henroFall/weatherDesktopInstaller.git
check_exit_status
sudo mkdir /opt/WeatherDesk
check_exit_status
sudo cp /tmp/WeatherDesk/*.py /opt/WeatherDesk/
check_exit_status
sudo cp /tmp/WeatherDesk/install/weatherdesk-service.service /etc/systemd/system
check_exit_status
sudo chmod +x /opt/WeatherDesk/WeatherDesk.py
check_exit_status
sudo ln -s /opt/WeatherDesk/WeatherDesk.py /usr/local/bin/WeatherDesk
check_exit_status
mkdir ~/.WeatherDesk_walls
check_exit_status
echo "Downloading wallpaper images..."
wget -q https://github.com/bharadwaj-raju/FireWatch-WeatherDesk-Pack/archive/master.tar.gz -O /tmp/firewatchpack.tar.gz
check_exit_status
tar -xvf /tmp/firewatchpack.tar.gz -C ~/.weatherdesk_walls/ --strip-components=1
check_exit_status
cleanup
check_exit_status
  else 
      echo "WeatherDesktop w/ FireWatch WILL NOT be configured." 
fi