# Dev Container Feature: GUI via VNC

This repository provides a [Dev Container Feature](https://containers.dev/implementors/features/) that enables you to run graphical user interface (GUI) applications inside your development container.

It's useful for tasks like running headed Playwright tests or developing GUI applications directly within the isolated environment of a dev container.

### XFCE Desktop Environment

This Feature installs the XFCE desktop environment, a lightweight option that does not require a dedicated GPU.

To use it, add the Feature to your `devcontainer.json`:

```jsonc
{
    "name": "Node.js & TypeScript",
    "image": "mcr.microsoft.com/devcontainers/typescript-node:1-22-bookworm",
    "features": {
        "ghcr.io/skkdevcraft/gui-vnc-desktop/xfce:latest": {
            "vncPassword": "password"
        }
    },
    // Forward the VNC server port
    "forwardPorts": [5901]
}
```

**To start the GUI session:**

1.  Once your dev container is running, open a terminal inside it.
2.  Run the `start-vnc` script.

    ```bash
    $ start-vnc

    New Xtigervnc server 'ad88e91d2ab4:1 (node)' on port 5901 for display :1.
    Use xtigervncviewer -SecurityTypes VncAuth -passwd /tmp/tigervnc.gYIYWn/passwd :1 to connect to the VNC server.
    ```
3.  Connect to `localhost:5901` (or `vnc://localhost:5901`) using your preferred VNC viewer.

## Security Considerations

A VNC server provides remote access to the container, so it is important to ensure that access is restricted. This feature helps secure the VNC connection in the following ways:

- **On-Demand Service:** The VNC server is only started when you explicitly run the `start-vnc` script.
- **Password Protection:** The server is always protected by a password.
- **Local Access:** By default, VS Code forwards ports to `localhost`, meaning the VNC server is only accessible from your local machine.
- **Host Firewall:** For an additional layer of security, ensure that your host machine's firewall is enabled and properly configured.

## OS Support

This feature is intended for Debian or Ubuntu-based distributions that use the `apt` package manager.

The `install.sh` script requires `bash` to be installed.

## Contributing

Contributions are welcome! If you have suggestions for improvements or encounter any issues, please feel free to open an issue or submit a pull request.


