# setup QT version 5.9.5
sudo apt-get update
sudo apt-get install qtcreator
sudo apt-get install qt5-default
sudo apt-get install qt5-doc
sudo apt-get install qt5-doc-html qtbase5-doc-html
sudo apt-get install qml-module-qtquick-controls
sudo apt-get install qtdeclarative5-dev
sudo apt-get install qml-module-qtquick-controls2

# setup build OpenCV 4.5.3
sudo apt-get install build-essential cmake git pkg-config libgtk-3-dev
sudo apt-get install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
sudo apt-get install libxvidcore-dev libx264-dev libjpeg-dev libpng-dev libtiff-dev
sudo apt-get install gfortran openexr libatlas-base-dev python3-dev python3-numpy
sudo apt-get install libtbb2 libtbb-dev libdc1394-22-dev

mkdir ~/opencv_build
cd ~/opencv_build

git clone https://github.com/opencv/opencv.git
cd opencv
git checkout 4.5.3
cd ~/opencv_build

git clone https://github.com/opencv/opencv_contrib.git
cd opencv_contrib
git checkout 4.5.3
cd ~/opencv_build

cd ~/opencv_build/opencv
mkdir build
cd build

cmake -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=/usr/local -DINSTALL_C_EXAMPLES=ON -DINSTALL_PYTHON_EXAMPLES=ON -DOPENCV_GENERATE_PKGCONFIG=ON -D OPENCV_EXTRA_MODULES_PATH=~/opencv_build/opencv_contrib/modules -DBUILD_EXAMPLES=ON ..

sudo make -j$(nproc)
sudo make install
pkg-config --modversion opencv4
###########
# OUTPUT
# 4.5.3
###########

# setup build NCNN
cd ~/
mkdir tencent
cd tencent/
cd ncnn
git clone https://github.com/Tencent/ncnn.git
git submodule update --init
sudo apt install build-essential git cmake libprotobuf-dev protobuf-compiler libvulkan-dev vulkan-utils
mkdir -p build
cd build
# if Bug unreference to vulkan lib ==> change -DNCNN_VULKAN=ON ==> -DNCNN_VULKAN=OFF
cmake -DCMAKE_BUILD_TYPE=Release -DNCNN_VULKAN=ON -DNCNN_BUILD_EXAMPLES=ON ..
make -j$(nproc)
sudo make install

# build lib socketio
cd ~
git clone --recurse-submodules https://github.com/socketio/socket.io-client-cpp.git
cd socket.io-client-cpp
cmake ./
sudo make install



# fix bug glslang reuired cmake > 3.14
sudo apt-get remove cmake
sudo apt-get install build-essential libssl-dev
cd ~
wget https://github.com/Kitware/CMake/releases/download/v3.20.0/cmake-3.20.0.tar.gz
tar -zxvf cmake-3.20.0.tar.gz
cd cmake-3.20.0
./bootstrap
sudo make
sudo make install
cmake --version 
# version 3.20.0

# run source 
cd ~ 
mkdir workplace
cd workplace
git clone https://github.com/duongtt1/sm-qmake.git
cd sm-qmake
# open Qt creator => File => Open File or project => pick file .pro in source sm-qmake
# build ==> copy all folder in ./Model_debug replace to 
