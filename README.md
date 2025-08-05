# Dev Container Feature: GUI via VNC

This repository provides a [Dev Container Feature](https://containers.dev/implementors/features/) that enables you to run graphical user interface (GUI) applications inside your development container.

It's useful for tasks like running headed Playwright tests or developing GUI applications directly within the isolated environment of a dev container.

### `XFCE` Desktop Environment

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
2.  Run the `start-vnc.sh` script.

    ```bash
    $ start-vnc.sh

    New Xtigervnc server 'ad88e91d2ab4:1 (node)' on port 5901 for display :1.
    Use xtigervncviewer -SecurityTypes VncAuth -passwd /tmp/tigervnc.gYIYWn/passwd :1 to connect to the VNC server.
    ```
3.  Connect to `localhost:5901` (or `vnc://localhost:5901`) using your preferred VNC viewer.

## Contributing

Contributions are welcome! If you have suggestions for improvements or encounter any issues, please feel free to open an issue or submit a pull request.


