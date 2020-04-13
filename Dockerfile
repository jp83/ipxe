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

WORKDIR ipxe/src

RUN sed -i 's/#undef.*DOWNLOAD_PROTO_HTTPS/#define DOWNLOAD_PROTO_HTTPS/g' config/general.h
RUN make

VOLUME /custom-pxe

COPY build.sh .
RUN chmod +x build.sh

CMD /ipxe/src//build.sh
