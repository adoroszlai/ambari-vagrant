#!/usr/bin/env bash

set -e -u

yum install -y git zsh

git clone https://github.com/ellipsis/ellipsis ~/.ellipsis
export PATH=${PATH}:~/.ellipsis/bin

curl -sL git.io/antibody | sh -s

ellipsis install https://github.com/adoroszlai/dotfiles
zsh -i -c 'exit' # cache warm-up
usermod -s /usr/bin/zsh root
