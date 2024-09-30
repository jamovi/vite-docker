
FROM ubuntu:22.04

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    ca-certificates \
    curl

RUN curl -v -sL https://deb.nodesource.com/setup_18.x | bash
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    nodejs \
    unionfs-fuse

RUN npm install -g vite

WORKDIR /source

EXPOSE 5173
EXPOSE 24678

ENTRYPOINT ["/bin/sh", "-c"]
CMD ["vite"]
