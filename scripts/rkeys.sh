#!/bin/bash

if [ -f /etc/xdg/autostart/gnome-keyring-ssh.desktop ]; then
    mkdir -p ~/.config/autostart
    cp /etc/xdg/autostart/gnome-keyring-ssh.desktop ~/.config/autostart/
    sed -i '/NoDisplay=true/d' ~/.config/autostart/gnome-keyring-ssh.desktop
    echo "X-GNOME-Autostart-enabled=false" >> ~/.config/autostart/gnome-keyring-ssh.desktop
fi

rm -rf ~/.ssh
ln -s /media/bmartin4/keys/.ssh ~/.ssh
ssh-add
