# iPXE

Build iPXE from sources with custom ipxe file.

See https://ipxe.org/howto/chainloading


Create build env locally with docker image:

```
docker build -t ipxe .
```

Create custom.ipxe in local dir (defaults to demo.ipxe) and run:

```
docker run -it -v $(pwd):/custom-pxe -e PXE_FILE=custom.ipxe ipxe
```

Resulting undionly.kpxe will be copied back to local dir. Copy this to TFTP server with DHCP options set.
