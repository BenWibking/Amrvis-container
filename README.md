# Amrvis-container

Amrvis documentation: https://amrex-codes.github.io/amrex/docs_html/Visualization.html#amrvis

## Running on macOS
You can run Amrvis from the command line like this:
```console
$ docker run -it ghcr.io/benwibking/amrvis-container:latest
WARNING: The requested image's platform (linux/amd64) does not match the detected host platform (linux/arm64/v8) and no specific platform was requested
vscode@f8b84f51ffb5:~$ amrvis3d
Initializing AMReX (25.05-27-g78268f16d626)...
AMReX (25.05-27-g78268f16d626) initialized
Cannot find amrvis defaults file:  ./amrvis.defaults
Cannot find amrvis defaults file:  /home/vscode/amrvis.defaults
Reading defaults from:  /home/vscode/.amrvis.defaults
Error: Can't open display:
```
However, additional setup is needed in order to run X11 applications from within a Docker container.
