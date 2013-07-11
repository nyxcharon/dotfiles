# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -f /etc/xdg/autostart/gnome-keyring-ssh.desktop ]; then
    mkdir -p ~/.config/autostart
    cp /etc/xdg/autostart/gnome-keyring-ssh.desktop ~/.config/autostart/
    sed -i '/NoDisplay=true/d' ~/.config/autostart/gnome-keyring-ssh.desktop
    echo "X-GNOME-Autostart-enabled=false" >> ~/.config/autostart/gnome-keyring-ssh.desktop
fi

## set background
result=`pgrep X`
if [ $? -eq 0 ]; then 
    gsettings set org.gnome.desktop.background picture-uri file:///cloudhome/${USER}/startup/back.png
    dconf write /org/compiz/profiles/unity/plugins/unityshell/icon-size 26
    if [ -d ~/.gconf ]; then 
	rm -rf ~/.gconf
    fi
    ln -s /cloudhome/${USER}/.gconf ~/
fi

## create link to /cloudhome
if ! [ -h /home/${USER}/cloud ]; then
    ln -s /cloudhome/${USER}/ /home/${USER}/cloud
fi

##Emacs stuff
if ! [ -h /home/${USER}/.emacs.d ]; then
    cp -r /cloudhome/${USER}/.emacs.d
fi
if ! [ -h /home/${USER}/.emacs ]; then
    cp -r /cloudhome/${USER}/.emacs
fi


## remove useless files
if [ -f /home/${USER}/Desktop/README.nohome ]; then
    rm /home/${USER}/Desktop/README.nohome
fi
if [ -f /home/${USER}/examples.desktop ]; then
    rm /home/${USER}/examples.desktop
fi

#Creat icon symlink and set theme
#if ! [ -h /usr/share/icons/Faenza ]; then
#    ln -s /cloudhome/bmartin4/startup/Faenza /usr/share/icons/Faenza
#    gsettings set org.gnome.desktop.interface icon-theme 'Faenza'
#fi



hostname=`echo ${HOSTNAME} | tr '[A-Z]' '[a-z]'`

 if [[ echo $hostname | grep -q "cseesystems" ]]; then
#Move netbeans files into place
sudo cp /cloudhome/bmartin4/netbeans/launcher/netbeans.desktop /usr/share/applications
sudo cp -r /cloudhome/bmartin4/netbeans/launcher/* /usr/share/icons/hicolor


# Locally set unity launcher
gsettings set com.canonical.Unity.Launcher favorites "['ubiquity-gtkui.desktop', 'nautilus-home.desktop', 'chromium-browser.desktop', 'gnome-terminal.desktop', 'pidgin.desktop','netbeans.desktop']"

#Command used to recompile the schema change for the Unity launcher change, and to set workspaces
glib-compile-schemas /usr/share/glib-2.0/schemas/

fi

GIT=`git --version`
if [ $? -eq 0 ]; then
    git config --global user.email "nyxcharon@gmail.com"
    git config --global user.name "nyxcharon"
fi

if ! [ -h /home/${USER}/.purple ]; then
    ln -s /cloudhome/${USER}/.purple /home/${USER}/.purple
fi
