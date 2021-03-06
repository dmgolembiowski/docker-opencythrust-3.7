FROM python:3.7
MAINTAINER David Golembiowski <dmgolembiowski@gmail.com>, Josip Janzic <josip@jjanzic.com>, mikigom <sjh14@gist.ac.kr>

RUN apt-get update && \
        apt-get install -y \
        build-essential \
        cmake \
        git \
        wget \
        unzip \
        yasm \
        pkg-config \
        libswscale-dev \
        libtbb2 \
        libtbb-dev \
        libjpeg-dev \
        libpng-dev \
        libtiff-dev \
        libavformat-dev \
        libpq-dev

RUN pip install numpy

WORKDIR /
ENV OPENCV_VERSION="4.0.1"
RUN wget https://github.com/opencv/opencv_contrib/archive/${OPENCV_VERSION}.zip \
&& unzip ${OPENCV_VERSION}.zip \
&& rm ${OPENCV_VERSION}.zip
RUN wget https://github.com/opencv/opencv/archive/${OPENCV_VERSION}.zip \
&& unzip ${OPENCV_VERSION}.zip \
&& mkdir /opencv-${OPENCV_VERSION}/cmake_binary \
&& cd /opencv-${OPENCV_VERSION}/cmake_binary \
&& cmake -DBUILD_TIFF=ON \
  -DBUILD_opencv_java=OFF \
  -DOPENCV_EXTRA_MODULES_PATH=/opencv_contrib-${OPENCV_VERSION}/modules \
  -DWITH_CUDA=OFF \
  -DWITH_OPENGL=ON \
  -DWITH_OPENCL=ON \
  -DWITH_IPP=ON \
  -DWITH_TBB=ON \
  -DWITH_EIGEN=ON \
  -DWITH_V4L=ON \
  -DBUILD_TESTS=OFF \
  -DBUILD_PERF_TESTS=OFF \
  -DOPENCV_ENABLE_NONFREE=ON \
  -DCMAKE_BUILD_TYPE=RELEASE \
  -DCMAKE_INSTALL_PREFIX=$(python3.7 -c "import sys; print(sys.prefix)") \
  -DPYTHON_EXECUTABLE=$(which python3.7) \
  -DPYTHON_INCLUDE_DIR=$(python3.7 -c "from distutils.sysconfig import get_python_inc; print(get_python_inc())") \
  -DPYTHON_PACKAGES_PATH=$(python3.7 -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())") \
  .. \
&& make install \
&& rm /${OPENCV_VERSION}.zip \
&& rm -r /opencv-${OPENCV_VERSION}
RUN ln -s \
  /usr/local/python/cv2/python-3.7/cv2.cpython-37m-x86_64-linux-gnu.so \
  /usr/local/lib/python3.7/site-packages/cv2.so
RUN wget --https-only --secure-protocol=TLSv1_2 -O- https://sh.rustup.rs > /usr/bin/rustup
RUN for line in "\e[1;33mAfter starting a pod with \`docker run -it 'opencythrust-3.7'\`\e[0m" "\e[1;33myou can create a new user by running \`adduser <username>\`, followed by\e[0m" "\e[1;32mroot@abc123 # usermod -aG sudo <username> && su <username>\e[0m" "\e[1;33mthen as that user you can execute:\n\e[0m" "\e[1;32m<username>@abc123 $ /usr/bin/rustup\e[0m" "\e[1;32m<username>@abc123 $ cargo install cargo-edit\e[0m" "\e[1;32m<username>@abc123 $ cargo new cvProject && cd cvProject\e[0m" "\e[1;32m<username>@abc123 $ cargo add opencv = {version = \"0.34\", features = [\"contrib\"]}\e[0m"; do echo -e "$line"; done

