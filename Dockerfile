############################################################
# Dockerfile to build Frama-C environment container images
# based on Ubuntu.
# Usage:
#   $ docker build -t hbgit/framac --no-cache -f Dockerfile .
#   $ docker run -it --name=framac -v $(pwd):/home/framac/devel_tool:Z --user $(id -u):$(id -g) hbgit/framac /bin/bash
#
# The docker user is "framac" and the password is "framac"
# Docker tips:
#  You can check that the container still exists by running: $ docker ps -a
#  You can restart the container by running: docker start -ai framac
############################################################
FROM ubuntu:18.04

# Metadata indicating an image maintainer.
MAINTAINER <herberthb12@gmail.com>

# Update the repository sources list
RUN apt-get update

# Devel packages
RUN apt-get install -y sudo \	
    build-essential \    
    python-minimal \
    cmake \
    ninja-build \
    wget \
    curl \
    unionfs-fuse \
    vim \
    doxygen \    
    python3 \
    python3-pip \
    opam

# Clean packages installation
RUN apt-get clean

RUN useradd -m framac && \
    echo framac:framac | chpasswd && \
    cp /etc/sudoers /etc/sudoers.bak && \
    echo 'framac  ALL=(root) NOPASSWD: ALL' >> /etc/sudoers

USER framac
RUN mkdir /home/framac/devel_tool
WORKDIR /home/framac/devel_tool/

RUN cd /home/framac/devel_tool/


### Installing Frama-C
RUN opam init
RUN opam install depext
RUN opam depext frama-c
RUN opam install frama-c
RUN eval `opam config env`


RUN sudo chown -R framac:framac .

VOLUME /home/framac/devel_tool/
# Revoke password-less sudo and Set up sudo access for the ``framac`` user so it
# requires a password
USER root
RUN mv /etc/sudoers.bak /etc/sudoers && \
    echo 'framac  ALL=(root) ALL' >> /etc/sudoers

USER framac

##################### INSTALLATION END #####################
