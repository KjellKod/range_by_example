#!/bin/bash
sudo uname -a
sudo lsb_release -a
sudo add-apt-repository -y ppa:jonathonf/gcc-7.1
sudo apt-get update
sudo apt-get install gcc-7
sudo apt-get install g++-7

git clone https://github.com/ericniebler/range-v3.git
cp -r range-v3/include/* /usr/local/include/.

pwd
ls
mkdir build && cd build
cmake ..
make -j

# until we have unit tests. find all executables and run them
rm -rf CMake*
find . -type f -executable -exec '{}' ';'
# ctest --output-on-failure


