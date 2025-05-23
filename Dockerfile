FROM mcr.microsoft.com/devcontainers/cpp:ubuntu-24.04

RUN apt-get --yes -qq update \
 && apt-get --yes -qq upgrade \
 && apt-get --yes -qq install build-essential \
                      git cmake clangd gcc g++ \
                      python3-dev python3-numpy python3-matplotlib python3-pip pipx \
                      libopenmpi-dev \
                      libhdf5-mpi-dev \
 && apt-get --yes -qq clean \
 && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/AMReX-Codes/amrex.git

RUN git clone https://github.com/AMReX-Codes/Amrvis.git
COPY GNUmakefile Amrvis/GNUmakefile
RUN cd Amrvis && make -j`nproc`

WORKDIR /home/ubuntu
USER ubuntu

CMD [ "/bin/bash" ]
