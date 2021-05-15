ARG ubuntu_image_tag=latest
FROM ubuntu:${ubuntu_image_tag}

# -- Layer: OS + Python 3.7

ARG shared_workspace=/opt/workspace

RUN mkdir -p ${shared_workspace} && \
    apt update -y && \
    apt upgrade -y && \
    apt install -y python3 python-dev python3-pip python3-venv vim curl wget && \
    apt install -y mlocate default-jdk iproute2 && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    rm -rf /var/lib/apt/lists/*

ENV SHARED_WORKSPACE=${shared_workspace}

# -- Runtime

VOLUME ${shared_workspace}
CMD ["bash"]
