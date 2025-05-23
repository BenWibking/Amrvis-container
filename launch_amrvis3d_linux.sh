#!/bin/sh

## Wrapper script to launch amrvis2d inside a Docker container on Linux

PORT=1
MOUNT_DIR=${1:-`pwd`}
AMRVIS_EXE=/Amrvis3D/amrvis3d.gnu.ex

docker run --platform linux/amd64 -v $MOUNT_DIR:/home/vscode/data -e DISPLAY=localhost:$PORT ghcr.io/benwibking/amrvis-container:main $AMRVIS_EXE
