#!/bin/bash
bash ./bashrc/init.sh
bash ./nvim/init.sh

lazygit --version
if [ $? -ne 0 ]; then
  sudo dnf copr enable atim/lazygit -y
  sudo dnf update -y
  sudo dnf install lazygit -y
fi
