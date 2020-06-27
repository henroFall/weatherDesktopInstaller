                                           %%
                                       (@@@@@@@@
                                   #@@@@@@@@@@@@@@@@(
                              #@@@@@@@@@@@@ &@@@@@@@@@@@@/
                        %@@@@@@@@@@@@@@         %@@@@@@@@@@@@@@(
              @@@@@@@@@@@@@@@@@@@@         @&        @@@@@@@@@@@@@@@@@@@@#
              /@@@@@@@@@@@@@&            (@@@@            /@@@@@@@@@@@@@@
               @@@@@@%                  @@@@@@@%                 ,@@@@@@&
               /@@@@@@                /@@@@@@@@@@                 @@@@@@/
                &@@@@@@              @@@@@@@@@@@@@@              (&@@@@&
                 @@@@@@@           #@@@@@@@@@@@@@@@@%           @@@@@@@
                  @@@@@@&         @@@&@@@@@@@@@@@@&@@@         %@@@@@&
                  /@@@@@@&          (@@@@@@@@@@@@@@           #@@@@@@
                   (@@@@@@&        @@@@@@@@@@@@@@@@@%        &@@@@@&/
                    /@@@@@@&      @@@@@@@@@@@@@@@@@@@@,     @@@@@@@
                      @@@@@@@   #%%#/   #@@@@@@( (%%%%%(   @@@@@@@
                       &@@@@@@&         /@@@@@@#         &@@@@@@/
                        /@@@@@@@%        @@@@@@(       /@@@@@@@
                          @@@@@@@@/      %%%#((      /@@@@@@@/
                            @@@@@@@@/              &@@@@@@@
                              @@@@@@@@@         ,@@@@@@@@%
                                &@@@@@@@@@   (@@@@@@@@@
                                   @@@@@@@@@@@@@@@@@%
                                      @@@@@@@@@@@
                                          @@@/
                                             (

 (  (                    )    )              )\\ )               )     )
 )\\))(   '   (     )  ( /( ( /(    (   (    (()/(     (      ( /(  ( /(              (  (
((*)()\\ )   ))\\ ( /(  )\\()))\\())  ))\\  )(    /(*))   ))\\ (   )\\()) )\\()) (   `)    )\\))(
_(())\\_)() /((_))(_))(_))/((_)\\  /((_)(()\\  (_))_   /((_))\\ ((_)\\ (_))/  )\\  /(/(   ((_)()\\   / /
\\ \\((_)/ /(_)) ((_)_ | |_ | |(_)(_))   ((_)  |   \\ (_)) ((_)| |(_)| |_  ((_)((_)_\\  _(()((_) / /
 \\ \\/\\/ / / -_)/ _` \|\|  *|| ' \\ / -*) | '*|  | |) |/ -*)(*-\<| / / |  *|/ * \\| '* \\) \\ V  V //*/
  \\*/\\\_/  \\**\_|\\**,*\| \\\_\_||*||\_|\\***\| \|*|    |\_**/ \\**\_|/**/|*\\*\\  \\**\|\\\_**/| .**/   \\*/\\*/
                 (     (    (                                            )  |*\|
                 )\\ )  )\\ ) )\\ )      (  (       (       \*   )   (    ( /(
                (()/( (()/((()/( (    )\\))(   '  )\\    \` )  /(   )\\   )\\())
                 /(*)) /(*))/(*)))\\  ((*)()\\ )((((*)(   ( )(*))(((*) ((*)\\
                (*))*|(*)) (*)) ((*) *(())\\*)())\\ * )\\ (*(*()) )\\***  *((*)
                \| \|*  \|* *\|\| * \\\| **\|\\ \\((*)/ /(*)*\\(*)|\_   \_|((/ **\|\| \|\| \|
                \| **|  | | |   /| *\|  \\ \\/\\/ /  / * \\    | |   | (** \| ** \|
                \|*\|   \|***\|\|*\|*\\\|***\|  \\*/\\*/  /*/ \\*\\   \|*\|    \\\_**\|\|*\|\|*\|

I've done nothing. This is my one-line installer for WeatherDesk, an awesome
app over on GitLab at https://gitlab.com/bharadwaj-raju/WeatherDesk ,
by @bharadwaj-raju , who must be a really great human.

Go on over there to find out what this is all about. It's awesome.

To run this installer:

\`wget -N https://raw.githubusercontent.com/henroFall/weatherDesktopInstaller/master/install_wd.sh && sudo chmod +x install_wd.sh && ./install_wd.sh && rm install_wd.sh\`

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
