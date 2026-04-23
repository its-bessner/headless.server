#!/bin/bash

#######################################
#    Copy the lines below and paste it
#    into the terminal of your
#    server to install a headless
#    x-server reachable by rdp
#######################################

apt install -y xfce4 xfce4-goodies
apt install -y lightdm
dpkg-reconfigure lightdm
apt install -y xrdp
systemctl enable xrdp
systemctl start xrdp
echo "startxfce4" > ~/.xsession
echo "startxfce4" | sudo tee /etc/skel/.xsession
apt install -y gnome-sudoku
systemctl start lightdm
adduser harrie ssl-cert
systemctl set-default multi-user.target
ufw allow 3389
ufw force-reload
ufw reload
apt install -y dbus-x11
systemctl restart xrdp
apt update
apt install -y xfce4 xfce4-goodies xrdp xorgxrdp dbus-x11
tee /etc/xrdp/startwm.sh > /dev/null <<'EOF'
#!/bin/sh
unset DBUS_SESSION_BUS_ADDRESS
unset XDG_RUNTIME_DIR
exec startxfce4
EOF
chmod +x /etc/xrdp/startwm.sh
"startxfce4" > ~/.xsession
systemctl restart xrdp

