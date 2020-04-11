FROM ubuntu:bionic

ENV PXE_FILE demo.ipxe

RUN \
  apt-get update && \
  apt-get install -y \
    build-essential \
    git \
    liblzma-dev \
    mkisofs \
    syslinux

RUN git clone git://git.ipxe.org/ipxe.git

COPY build.sh /ipxe/src
RUN chmod +x /ipxe/src/build.sh

WORKDIR ipxe/src

RUN make

VOLUME /custom-pxe

CMD /ipxe/src//build.sh
