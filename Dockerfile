FROM mcr.microsoft.com/devcontainers/cpp:ubuntu-24.04

RUN apt-get --yes -qq update \
 && apt-get --yes -qq upgrade \
 && apt-get --yes -qq install build-essential m4 \
		      libmotif-dev libxext-dev libxpm-dev \
 && apt-get --yes -qq clean \
 && rm -rf /var/lib/apt/lists/*

## build Volpack
RUN git clone https://ccse.lbl.gov/pub/Downloads/volpack.git && cd volpack && make -j`nproc`

## build Amrvis
RUN git clone https://github.com/AMReX-Codes/amrex.git && git clone https://github.com/AMReX-Codes/Amrvis.git
COPY GNUmakefile Amrvis/GNUmakefile
RUN cd Amrvis && make -j`nproc`

WORKDIR /home/ubuntu
USER ubuntu

CMD [ "/bin/bash" ]
