A collection of useful commands.

## Generate README.md

```bash
cd src
devcontainer features generate-docs -n skkdevcraft/gui-vnc-desktop
```

## Start the tests locally

```bash
# shows the full output of install.sh
export BUILDKIT_PROGRESS=plain

# Start the test.sh
devcontainer features test --features xfce --remote-user vscode --skip-scenarios --base-image mcr.microsoft.com/devcontainers/base:ubuntu .

# Start the scenario tests
devcontainer features test --features xfce --remote-user node --base-image mcr.microsoft.com/devcontainers/typescript-node:1-22-bookworm . --log-level trace
```

## Docker

```bash
# Remove all images
docker image prune -a
dokcer images
# Start an interactive session with a test image
docker run -it --rm --user node <image-name> /bin/bash
```