FROM ubuntu:noble
RUN apt-get update \
 && apt-get install --yes \
                    git \
                    curl \
                    bc \
                    bison \
                    build-essential \
                    ccache \
                    cpio \
                    fakeroot \
                    flex \
                    git \
                    kmod \
                    libelf-dev \
                    libncurses5-dev \
                    libssl-dev \
                    lz4 \
                    qtbase5-dev \
                    rsync \
                    schedtool \
                    wget \
                    zstd \
                    debhelper \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /usr/local/src
RUN git clone https://github.com/Frogging-Family/linux-tkg.git
WORKDIR /usr/local/src/linux-tkg
ADD custom.patch .
RUN git apply custom.patch
VOLUME /usr/local/src/linux-tkg/DEBS
CMD ./install.sh install