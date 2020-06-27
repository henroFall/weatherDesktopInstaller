WeatherDesktop w/ FireWatch Installer
====
I've done nothing. This is my one-line installer for WeatherDesk, an awesome
app over on GitLab at https://gitlab.com/bharadwaj-raju/WeatherDesk ,
by @bharadwaj-raju , who must be a really great human for having done it.

This, Oscar, and a few widgets sprinkled on top makes for a great kitchen PC.

Go on over to the GitLab link up there to find out what this module is all about. It's awesome.

To run this installer on its own:

\`wget -N https://raw.githubusercontent.com/henroFall/weatherDesktopInstaller/master/install_wd.sh && sudo chmod +x install_wd.sh && ./install_wd.sh && rm install_wd.sh\`

Note that you should probably not be calling this directly, but instead use the Oscar2 installer
over here: 

@bharadwaj-raju's code is under the GNU GPLv3 License, so this is as well.

What Am I doing?
----------------

This installer will:

* Grab the scripts from Gitlab
* Grab the wallpapers from the Firewatch collection
* Put everything in the rigth folders (under opt), and
  creates symlink to WeatherDesktop
* Install systemd service to start as user after desktop
* Offer to reboot
