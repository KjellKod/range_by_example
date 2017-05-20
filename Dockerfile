FROM ubuntu:16.04

# Install
RUN add-apt-repository -y ppa:jonathonf/gcc-7.1
RUN apt-get update
RUN apt-get install -y cmake software-properties-common git make
RUN apt-get install -y gcc-7 g++-7 

RUN mkdir -p /src/
RUN mkdir -p /src/build/
RUN git clone https://github.com/ericniebler/range-v3.git
RUN cp -r range-v3/include/* /usr/local/include/.

WORKDIR /src/build/

COPY . /src/
RUN cmake ..
RUN make
RUN rm -rf CMake* && find . -type f -executable -exec '{}' ';' 

