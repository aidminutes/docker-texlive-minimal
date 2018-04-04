FROM frolvlad/alpine-glibc:glibc-2.27

COPY texlive-profile.txt /tmp/

# set up packages
RUN apk add --no-cache wget perl xz && \
    wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz && \
    tar -xzf install-tl-unx.tar.gz && \
    install-tl-20*/install-tl --profile=/tmp/texlive-profile.txt && \
    apk --no-cache del xz

ENV PATH=/usr/local/texlive/bin/x86_64-linux:$PATH
RUN tlmgr update --self
