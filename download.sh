#!/bin/bash

function command_exists {
  command -v "$1" > /dev/null;
}

if ! command_exists brew ; then
  echo " --------- Homebrew ----------"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew update
  brew upgrade --all --cleanup
  brew -v
  echo " ------------ END ------------"
fi

if ! command_exists git ; then
  echo " ------------ Git ------------"
  brew install git
  git --version
  echo " ------------ END ------------"
fi

if ! command_exists mas ; then
  echo " ------------ Mas ------------"
  brew install mas
  echo " ------------ END ------------"
fi


