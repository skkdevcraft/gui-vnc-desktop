
# GUI VNC XFCE Desktop (xfce)

Installs XFCE desktop and VNC server in a devcontainer.

## Example Usage

```json
"features": {
    "ghcr.io/skkdevcraft/gui-vnc-desktop/xfce:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| vncPassword | Password to connect to the VNC session. If left empty, you will be asked to provide it the first time you start the VNC server. | string | password |

## How to Use

The VNC server is not started by default. To start it, run the `start-vnc.sh` command.

If you did not provide a VNC password through the `vncPassword` option, you will be prompted to set one the first time you run `start-vnc.sh`.

To connect to the VNC server, you need to forward port 5901.

**Connection Steps:**

1.  Run `start-vnc.sh` in your terminal.
2.  If prompted, enter a password for the VNC session.
3.  In VS Code, go to the "PORTS" tab and forward port 5901.
4.  Use a VNC viewer to connect to `localhost:5901` or `vnc://localhost:5901`.

## Security Considerations

A VNC server provides remote access to the container, so it is important to ensure that access is restricted. This feature helps secure the VNC connection in the following ways:

- **On-Demand Service:** The VNC server is only started when you explicitly run the `start-vnc.sh` script.
- **Password Protection:** The server is always protected by a password.
- **Local Access:** By default, VS Code forwards ports to `localhost`, meaning the VNC server is only accessible from your local machine.
- **Host Firewall:** For an additional layer of security, ensure that your host machine's firewall is enabled and properly configured.

## OS Support

This feature is intended for Debian or Ubuntu-based distributions that use the `apt` package manager.

The `install.sh` script requires `bash` to be installed.

---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/skkdevcraft/gui-vnc-desktop/blob/main/src/xfce/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
