#!/bin/bash
set -ex

echo "🔧 Installing XFCE, VNC server..."

export DEBIAN_FRONTEND=noninteractive

# Install XFCE and VNC
apt-get update && \
apt-get install -y \
    xfce4 xfce4-goodies \
    tigervnc-standalone-server \
    dbus-x11 x11-xserver-utils \
    xterm \
    wget gnupg

# Cleanup
apt-get clean && rm -rf /var/lib/apt/lists/*

# Get the current dev container user (from Features runtime)
TARGET_USER="${_REMOTE_USER:-node}"
TARGET_HOME="$(eval echo "~$TARGET_USER")"

echo "opa trpoa! $(whoami)"

mkdir -p "$TARGET_HOME/.vnc"
if [ -n "${_BUILD_ARG_VNCPASSWORD}" ]; then
    # Set VNC password
    echo "${_BUILD_ARG_VNCPASSWORD}" | vncpasswd -f > "$TARGET_HOME/.vnc/passwd"
    chmod 600 "$TARGET_HOME/.vnc/passwd"
else
    echo "A password will have to be provided the first time the server is started."
fi

# VNC xstartup config
cat <<EOF > "$TARGET_HOME/.vnc/xstartup"
#!/bin/sh
[ -f "$HOME/.Xresources" ] && xrdb \$HOME/.Xresources
startxfce4 &
EOF
chmod +x "$TARGET_HOME/.vnc/xstartup"

chown -R "$TARGET_USER:$TARGET_USER" "$TARGET_HOME/.vnc"

# Startup script
cat <<'EOF' > /usr/local/bin/start-vnc.sh
#!/bin/bash
export DISPLAY=:1
vncserver -kill :1 > /dev/null 2>&1 || true
vncserver :1 -geometry 1280x800 -depth 24
EOF
# tail -f ~/.vnc/*.log
chmod +x /usr/local/bin/start-vnc.sh

# Create a reminder script that only shows a message if the VNC server is NOT running
cat <<'EOF' > /etc/profile.d/vnc-reminder.sh
#!/bin/bash
if ! pgrep Xtigervnc > /dev/null 2>&1; then
  echo "👉 Reminder: Run start-vnc.sh to start the VNC desktop session (port 5901)."
fi
EOF

chmod +x /etc/profile.d/vnc-reminder.sh

# Call it from .bashrc to ensure it runs in interactive shells
echo '/etc/profile.d/vnc-reminder.sh' >> "$TARGET_HOME/.bashrc"
echo "✅ VNC reminder added to $TARGET_HOME/.bashrc"

# Set DISPLAY globally
echo 'export DISPLAY=:1' >> /etc/profile.d/display.sh

echo "✅ GUI environment installed and ready."

