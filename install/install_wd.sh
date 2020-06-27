#!/bin/bash
################################### STATIC BASE FUNCTIONS
rootCheck() {
    if ! [ $(id -u) = 0 ]
    then
        echo -e "\e[41m I am NOT root! Run WITH SUDO. \e[0m"
        exit 1
    fi
}

check_exit_status() {
    if [ $? -ne 0 ]
    then
        echo -e "\e[41m ERROR: PROCESS FAILED!\e[0m"
        echo
        read -p "The last command exited with an error. Exit script? (yes/no)" answer
        if [ "$answer" == "yes" ]
        then
            echo -e "EXITING. \e[0m"
            echo
            exit 1
        fi
    fi
}

maximize() {
    wmctrl -r :ACTIVE: -b toggle,maximized_vert,maximized_horz
}

################################### DYNAMIC BASE FUNCTIONS
welcome() {
echo
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
apt -y -qq install wmctrl
}

cleanup () {
rm -R /tmp/WeatherDesk
rm -R /tmp/weatherDesktopInstaller
}

################################### APP FUNCTIONS

################################### APP
echo 
#rootCheck
prereq
maximize
welcome
username=${SUDO_USER:-${USER}}
echo
echo "Now we can optionally install the WeatherDesktop w/ FireWatch Python script from bharadwaj-raju."
echo "This script will change the desktop background image based on your location, time of day, and current weather."
echo "It installs with the FireWatch background image pack, but you can customize the images by simply replacing them."

echo
read -p "Should I install and configure WeatherDesktop to run as a service at boot now y/n? [y]:" desktopYN
if [ -z "$desktopYN" ]; then desktopYN='y'
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
 apt -y -qq install git
 check_exit_status
 cd /tmp/
 echo "Cloning bharadwaj-raju's GitLab repo, all credit to bharadwaj-raju!"
 git clone -q https://gitlab.com/bharadwaj-raju/WeatherDesk.git
 check_exit_status
 git clone -q https://github.com/henroFall/weatherDesktopInstaller.git
 check_exit_status
 mkdir -p /opt/WeatherDesk
 check_exit_status
 cp /tmp/WeatherDesk/*.py /opt/WeatherDesk/
 cp /tmp/weatherDesktopInstaller/install/communityIcon_gupxos5vfkg01.jpg /opt/WeatherDesk/communityIcon_gupxos5vfkg01.jpg
 if ! [ -d -a "/home/$username/.config" ]; then mkdir -p /home/$username/.config 
 fi
 check_exit_status
 cd /home/$username/.config
 if ! [ -d -a "./autostart" ]; then mkdir -p /home/$username/.config/autostart 
 fi
 cd /tmp/
 check_exit_status
 cp /tmp/weatherDesktopInstaller/install/weatherdesk.desktop /home/$username/.config/autostart/
 check_exit_status
 chmod +x /opt/WeatherDesk/WeatherDesk.py
 check_exit_status
 ln -s /opt/WeatherDesk/WeatherDesk.py /usr/local/bin/WeatherDesk
 check_exit_status
 mkdir -p /home/$username/.weatherdesk_walls
 check_exit_status
 echo "Downloading wallpaper images..."
 wget -q https://github.com/bharadwaj-raju/FireWatch-WeatherDesk-Pack/archive/master.tar.gz -O /tmp/firewatchpack.tar.gz
 check_exit_status
 tar -xvf /tmp/firewatchpack.tar.gz -C /home/$username/.weatherdesk_walls/ --strip-components=1
 check_exit_status
 cleanup
 check_exit_status
 echo
 echo "Installation of WeatherDesktop / Firewatch module is complete."
 echo "Your wallpaper will update on the next reboot and will then update live!"
   else 
       echo "WeatherDesktop w/ FireWatch WILL NOT be configured." 
 fi
