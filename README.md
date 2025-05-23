# Amrvis-container

The Amrvis documentation is available [here](https://amrex-codes.github.io/amrex/docs_html/Visualization.html#amrvis).

## Running on macOS

### Install XQuartz and allow remote clients
There is a detailed guide available [here](https://gist.github.com/sorny/969fe55d85c9b0035b0109a31cbcb088#step-by-step-guide) on how to do this.

[TL;DR](https://en.wikipedia.org/wiki/TL;DR) version:
1. Install XQuartz
```console
$ brew install --cask xquartz
$ open -a XQuartz
```
2. Go to `XQuartz -> Settings... -> Security` and check the box for "Allow connections from network clients".
3. Reboot your computer (this step is required).

### Run the container
Run Amrvis from the command line like this:
```console
$ open -a XQuartz
$ xhost +localhost
localhost being added to access control list
$ docker run -v `pwd`:/home/vscode/data -e DISPLAY=docker.for.mac.host.internal:0 ghcr.io/benwibking/amrvis-container:latest
WARNING: The requested image's platform (linux/amd64) does not match the detected host platform (linux/arm64/v8) and no specific platform was requested
Initializing AMReX (25.05-27-g78268f16d626)...
AMReX (25.05-27-g78268f16d626) initialized
Cannot find amrvis defaults file:  ./amrvis.defaults
Cannot find amrvis defaults file:  /home/vscode/amrvis.defaults
Reading defaults from:  /home/vscode/.amrvis.defaults
```
Note that `xhost +localhost` must be done every time.

You should see a window that looks like this:
<img width="1018" alt="Screenshot 2025-05-23 at 1 08 12 PM" src="https://github.com/user-attachments/assets/a0e6a573-b235-45da-a2ad-4fee69007b21" />

Your current working directory on the host is bind-mounted into `/home/vscode/data`.