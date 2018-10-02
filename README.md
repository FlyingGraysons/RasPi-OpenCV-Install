# RasPi-OpenCV-Install
This script will install all the neccessary tools for openCV developement on a raspberry pi.  
It will install openCV 2, with python binding for python 2.7, or for python3 using pip3. The difference in executable is `install-cv.sh` vs `install-cv.sh-python3`.
The installed tools are:
 - Pip
 - Python 2.7
 - NumPy
 - OpenCV 2.4
 - virtualenv and virtualenvwrapper
 - build-essential
 - cmake
 - pkg-config
 - Image libraries: libjpeg8-dev libtiff4-dev libjasper-dev libpng12-dev
 - libgtk2.0-dev (for openCV GUI)
 - Video libraries: libavcodec-dev libavformat-dev libswscale-dev libv4l-dev 
 - OpenCV dependancies: libatlas-base-dev gfortran

### Usage
On the raspberry pi, run:  
`wget https://raw.githubusercontent.com/FlyingGraysons/RasPi-OpenCV-Install/master/install-cv.sh && sudo bash install-cv.sh`  
This will download and run the script.  
For the python3 version, run:  
`wget https://raw.githubusercontent.com/FlyingGraysons/RasPi-OpenCV-Install/master/install-cv-python3.sh && sudo bash install-cv.sh-python3`  


Every step of the process, blue text appears saying what will happen, and when completed, green text will appear saying that it has done that step. 

### Contributing
If you find any errors, please open an issue.  
If you want to make a contribution youself, fork the repo, and make a pull request. 
