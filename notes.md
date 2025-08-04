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

docker run -it --rm --user node vsc-1754289857366-58d99ea5ab49624bb1fd4a6dcdc20a3e0d4d0bbafb3e60e26d49f130a3572cc2-features /bin/bash


## Publish

```bash
devcontainer features publish -r ghcr.io -n skkdevcraft/gui-vnc-desktop ./src
```