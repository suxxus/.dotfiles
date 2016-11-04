#!/bin/bash
#
#

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export BASH_DIR=~/.bash

source $BASH_DIR/aliases
source $BASH_DIR/functions
source $BASH_DIR/variables
source ~/.bash_prompt

# Add tab completion for many Bash commands
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion;
fi;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# added by travis gem
[ -f /home/diego/.travis/travis.sh ] && source /home/diego/.travis/travis.sh

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export NVM_DIR="/home/diego/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
