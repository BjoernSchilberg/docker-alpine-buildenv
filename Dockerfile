FROM alpine

LABEL maintainer="bjoern@intevation.de"
LABEL version="1.0"

ENV USERNAME insert user name here!
ENV GITUSERNAME insert git user name here!
ENV GITUSEREMAIL insert git user email here! 

RUN apk upgrade -U &&\
    apk add alpine-sdk vim tmux curl wget screen &&\
    adduser -D $USERNAME &&\
    addgroup $USERNAME abuild && \
    echo "$USERNAME ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers &&\
    mkdir -p /var/cache/distfiles &&\
    chmod a+w /var/cache/distfiles &&\
    chgrp abuild /var/cache/distfiles &&\
    chmod g+w /var/cache/distfiles &&\
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories  &&\
    apk update

USER $USERNAME 
ENV HOME /home/$USERNAME
WORKDIR $HOME

RUN git config --global user.name $GITUSERNAME &&\
    git config --global user.email $GITUSEREMAIL &&\
    git clone git://git.alpinelinux.org/aports &&\
    abuild-keygen -a -i
