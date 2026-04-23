#!/bin/bash

apt update
apt install -y xfce4 xfce4-goodies tigervnc-standalone-server dbus-x11

# VNC initialisieren (setzt Passwort interaktiv)
vncserver :1

# wieder stoppen, um config zu schreiben
vncserver -kill :1

# sauberes Startup-Skript
mkdir -p ~/.vnc

cat > ~/.vnc/xstartup << 'EOF'
#!/bin/bash
xrdb $HOME/.Xresources
export XDG_RUNTIME_DIR=/run/user/$(id -u)
startxfce4 &
EOF

chmod +x ~/.vnc/xstartup

# VNC Server starten
vncserver :1

# Firewall öffnen
ufw allow 5901
ufw reload
