#!/bin/bash
# OpenCV install script
# Made by Henry Wildermuth
# More information: https://github.com/FlyingGraysons/RasPi-OpenCV-Install
# Downloads and configures:
#   Pip
#   Python 3
#   NumPy
#   OpenCV 2.4
#   Lots of other little packages neccessary for the install

# Colors for data text
blue=`tput setaf 7; tput setab 4`
green=`tput setaf 0; tput setab 2`
reset=`tput sgr0`
bel=`tput bel`

# do updates
echo "${blue}Installing updates${reset}"
sudo apt-get update
sudo apt-get -y upgrade
sudo rpi-update
echo "${green}Installed updates${reset}"

# download everything
echo "${blue}Installing supporting libraries${reset}"
sudo apt-get -y install build-essential cmake pkg-config libjpeg8-dev libtiff4-dev libjasper-dev libpng12-dev libgtk2.0-dev libavcodec-dev libavformat-dev libswscale-dev libv4l-dev libatlas-base-dev gfortran
echo "${green}Installed supporting libraries${reset}"

# Now download pip
echo "${blue}Installing pip${reset}"
apt-get -y install python3-pip
sudo pip install virtualenv virtualenvwrapper
sudo rm -rf ~/.cache/pip
echo "export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh" >> ~/.profile
source ~/.profile
mkvirtualenv cv
echo "${green}Installed pip${reset}"

# Install python
echo "${blue}Installing python${reset}"
sudo apt-get -y install python3
pip install numpy
echo "${green}Installed python${reset}"

# Download open cv
echo "${blue}Downloading openCV${reset}"
wget -O opencv-2.4.10.zip http://sourceforge.net/projects/opencvlibrary/files/opencv-unix/2.4.10/opencv-2.4.10.zip/download
unzip opencv-2.4.10.zip
cd opencv-2.4.10
echo "${green}Downloaded openCV${reset}"

# set compile flags to compile open-cv
echo "${blue}Setting compile flags${reset}"
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D BUILD_NEW_PYTHON_SUPPORT=ON -D INSTALL_C_EXAMPLES=ON -D INSTALL_PYTHON_EXAMPLES=ON  -D BUILD_EXAMPLES=ON ..

# compile open-cv
echo "${blue}Compiling openCV${reset}"
make
echo "${green}Compiled${reset}"

# Install opencv
echo "${blue}Installing openCV${reset}"
sudo make install
sudo ldconfig
echo "${green}Installed openCV${reset}"

# some final linking
echo "${blue}Final cleanup${reset}"
cd ~/.virtualenvs/cv/lib/python2.7/site-packages/
ln -s /usr/local/lib/python2.7/site-packages/cv2.so cv2.so
ln -s /usr/local/lib/python2.7/site-packages/cv.py cv.py
echo "${green}Final cleanup complete${reset}"
echo "${green}Script done. Congratulations${reset}"
echo "${bel}${bel}${bel}${bel}${bel}"
