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

cmake   -D CMAKE_BUILD_TYPE=RELEASE \
        -D CMAKE_INSTALL_PREFIX=/usr/local \
        -D INSTALL_C_EXAMPLES=ON \
        -D INSTALL_PYTHON_EXAMPLES=ON \
        -D OPENCV_GENERATE_PKGCONFIG=ON \
        -D OPENCV_EXTRA_MODULES_PATH=~/opencv_build/opencv_contrib/modules \
        -D BUILD_EXAMPLES=ON \ 
        ..

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
git clone https://github.com/Tencent/ncnn.git
git submodule update --init
sudo apt install build-essential git cmake libprotobuf-dev protobuf-compiler libvulkan-dev vulkan-utils
wget https://sdk.lunarg.com/sdk/download/1.2.189.0/linux/vulkansdk-linux-x86_64-1.2.189.0.tar.gz?Human=true -O vulkansdk-linux-x86_64-1.2.189.0.tar.gz
tar -xf vulkansdk-linux-x86_64-1.2.189.0.tar.gz
export VULKAN_SDK=$(pwd)/1.2.189.0/x86_64
cd ncnn
mkdir -p build
cd build
cmake -DCMAKE_BUILD_TYPE=Release -DNCNN_VULKAN=ON -DNCNN_BUILD_EXAMPLES=ON ..
make -j$(nproc)