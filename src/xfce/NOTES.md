## How to Use

The VNC server is not started by default. To start it, run the `start-vnc` command.

If you did not provide a VNC password through the `vncPassword` option, you will be prompted to set one the first time you run `start-vnc`.

To connect to the VNC server, you need to forward port 5901.

**Connection Steps:**

1.  Run `start-vnc` in your terminal.
2.  If prompted, enter a password for the VNC session.
3.  In VS Code, go to the "PORTS" tab and forward port 5901.
4.  Use a VNC viewer to connect to `localhost:5901` or `vnc://localhost:5901`.

## Security Considerations

A VNC server provides remote access to the container, so it is important to ensure that access is restricted. This feature helps secure the VNC connection in the following ways:

- **On-Demand Service:** The VNC server is only started when you explicitly run the `start-vnc` script.
- **Password Protection:** The server is always protected by a password.
- **Local Access:** By default, VS Code forwards ports to `localhost`, meaning the VNC server is only accessible from your local machine.
- **Host Firewall:** For an additional layer of security, ensure that your host machine's firewall is enabled and properly configured.

## OS Support

This feature is intended for Debian or Ubuntu-based distributions that use the `apt` package manager.

The `install.sh` script requires `bash` to be installed.