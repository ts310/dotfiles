#!/bin/sh

sudo -s
echo 'Moving to /usr/local/src'
cd /usr/local/src
pwd

sudo apt-get update
sudo apt-get remove ffmpeg x264 libx264-dev
sudo apt-get install \
  build-essential \
  subversion \
  git-core \
  checkinstall \
  yasm \
  texi2html \
  libfaac-dev \
  libfaad-dev \
  libmp3lame-dev \
  libopencore-amrnb-dev \
  libopencore-amrwb-dev \
  libsdl1.2-dev \
  libtheora-dev \
  libx11-dev \
  libxfixes-dev \
  libxvidcore-dev \
  zlib1g-dev

echo 'Clean directory'
sudo rm -rf ffmpeg x264
export LANG=C

echo 'Checking out x264'
git clone git://git.videolan.org/x264.git

echo 'Build x264'
cd x264
./configure
make

echo 'Install x264'
sudo checkinstall \
  --pkgname=x264 \
  --pkgversion "2:0.`grep X264_BUILD x264.h -m1 | cut -d' ' -f3`.`git rev-list HEAD | wc -l`+git`git rev-list HEAD -n 1 | head -c 7`" \
  --backup=no \
  --default | tee ../x264install.txt
cd ..

echo 'Checking out ffmpeg'
svn checkout svn://svn.ffmpeg.org/ffmpeg/trunk/ ffmpeg

echo 'Build ffmpeg'
cd ffmpeg
./configure \
  --enable-gpl \
  --enable-version3 \
  --enable-nonfree \
  --enable-postproc \
  --enable-pthreads \
  --enable-libfaac \
  --enable-libmp3lame \
  --enable-libopencore-amrnb \
  --enable-libopencore-amrwb \
  --enable-libtheora \
  --enable-libvorbis \
  --enable-libx264 \
  --enable-libxvid \
  --enable-x11grab
make

echo 'Install ffmpeg'
sudo checkinstall \
  --pkgname=ffmpeg \
  --pkgversion "4:SVN-r`svn info | grep Revision | awk '{ print $NF }'`" \
  --backup=no \
  --default

exit
