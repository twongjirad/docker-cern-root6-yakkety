FROM ubuntu:16.10

MAINTAINER taritree.wongjirad@tufts.edu

RUN apt-get update && \
    apt-get install -y binutils \
	    	    	cmake \
			dpkg-dev \
			libfftw3-dev \
			gcc \
			g++ \
			gfortran \
			git \
			libgsl0-dev \
			libjpeg-dev \
			libpng-dev \
			libx11-dev \
			libxext-dev \
			libxft-dev \
			libxml2-dev \
			libxpm-dev \
			python \
			ipython-notebook \
			python-dev \
			tar \
			wget && \
    cd /tmp/ && \
    wget https://root.cern.ch/download/root_v6.08.06.source.tar.gz && tar -zxvf root_v6.08.06.source.tar.gz -C /tmp/ && \
    mkdir -p /tmp/build && cd /tmp/build && \
    cmake -DCMAKE_INSTALL_PREFIX=/usr/local -DGNUINSTALL=ON -DMINUIT2=ON /tmp/root-6.08.06 && \
    cmake --build . --target install -- -j4 && \
    rm /tmp/root_v6.08.06.source.tar.gz && rm -r /tmp/build && rm -r /tmp/root-6.08.06 && \
    apt-get autoremove -y && apt-get clean -y