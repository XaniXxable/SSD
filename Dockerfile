# Step 1: Use the official Python 3.12 base image
FROM python:3.12-slim

# Step 2: Set environment variables to avoid user prompts during package installs
ENV DEBIAN_FRONTEND=noninteractive

# Step 3: Update the package list and install system dependencies
RUN apt-get update && apt-get install -y \
    gdb \
    git \
    build-essential \
    libssl-dev \
    libffi-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    wget \
    curl \
    llvm \
    libncurses5-dev \
    libncursesw5-dev \
    xz-utils \
    tk-dev \
    iproute2 \
    iputils-ping \
    bash \
    screen \
    ncurses-term \
    libtinfo5 \
    tmux

# Step 4: Install Pwndbg
RUN git clone https://github.com/pwndbg/pwndbg /opt/pwndbg \
    && cd /opt/pwndbg \
    && ./setup.sh

# Step 5: Install Pwntools
RUN pip install --upgrade pip \
    && pip install pwntools


# Step 6: Set the entry point to bash so you can manually use GDB or Pwntools in a container
ENTRYPOINT ["/bin/bash"]
