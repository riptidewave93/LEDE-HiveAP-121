#!/bin/bash

firstbuild=0
clonedir=./lede
cpu_num=$(grep -c processor /proc/cpuinfo)

# Print messages in cyan blue
Msg() {
  echo -e "\e[96m$1\e[39m"
}

# Do we want menuconfig's and an option to save configs?
if [ "$1" = "modify" ]; then
  modify=1
else
  modify=0
fi

Msg "Starting Build Process!"

if [ ! -d "$clonedir" ]; then
  firstbuild=1
  Msg "Cloning Repo..."
  git clone https://github.com/lede-project/source $clonedir
  cd $clonedir
  git reset --hard 9d91ef52c38804857025742bad48a73bc8be0866
  cd - > /dev/null
fi

if [ "$firstbuild" -eq "0" ]; then
  Msg "Cleaning Builddir..."
  cd $clonedir
  rm -rf ./bin
  make clean
  cd - > /dev/null
fi

Msg "Applying overlay..."
cp -R ./overlay/* $clonedir/

if [ "$firstbuild" -eq "1" ]; then
  Msg "Installing feeds..."
  cd $clonedir
  ./scripts/feeds update -a
  ./scripts/feeds install -a
  if [ -f "../config/diffconfig" ]; then
  	Msg "Applying and Expanding config..."
  	cp ../config/diffconfig ./.config
  	make defconfig
  fi
  cd - > /dev/null
fi

if [ "$modify" -eq "1" ]; then
  cd $clonedir
  Msg "Loading Menuconfig"
  make menuconfig -j$cpu_num V=s
  cd - > /dev/null
fi

Msg "Building Time!!!"
cd $clonedir
make -j$cpu_num V=s

if [ $? -ne 0 ]; then
  cd - > /dev/null
  Msg "Build Failed!"
  exit 1
else
  cd - > /dev/null
  Msg "Compile Complete!"
fi

Msg "Build.sh Finished!"
