# nikhilmetrani/python3-jupyter:latest + tensorflow-cpu
# docker build -t nikhilmetrani/tensorflow-cpu:latest .

FROM nikhilmetrani/python3-jupyter:latest
MAINTAINER Nikhil Metrani <Nikhil Metrani>

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --no-install-recommends \
            libfreetype6-dev \
            libpng12-dev \
            libzmq3-dev \
            pkg-config \
            rsync \
            software-properties-common \
            unzip \
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/*

RUN pip3 install --no-cache-dir \
        matplotlib \
        numpy \
        six \
        protobuf \
        werkzeug \
        scipy \
        sklearn \
        pandas \
        Pillow \
        tensorflow \
        && \
    python3 -m ipykernel.kernelspec

COPY support/tf_getting_started.ipynb /home/

# TensorBoard
EXPOSE 6006
