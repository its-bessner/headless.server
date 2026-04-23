#!/bin/bash

apt update
apt install -y xfce4 xfce4-goodies xrdp xorgxrdp dbus-x11

systemctl enable xrdp
systemctl start xrdp

# XFCE Session für User
echo "startxfce4" > ~/.xsession

# xrdp Startscript sauber setzen
tee /etc/xrdp/startwm.sh > /dev/null <<'EOF'
#!/bin/sh
unset DBUS_SESSION_BUS_ADDRESS
unset XDG_RUNTIME_DIR
exec startxfce4
EOF

chmod +x /etc/xrdp/startwm.sh

systemctl restart xrdp

ufw allow 3389
ufw reload
