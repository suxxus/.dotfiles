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
export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/Cellar/ruby/2.0.0-p195/bin:/home/diego/TEE-CLC-12.0.2:/home/diego/.nvm/versions/node/v8.6.0/bin:/home/diego/bin:/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/lib/jvm/java-8-oracle/bin:/usr/lib/jvm/java-8-oracle/db/bin:/usr/lib/jvm/java-8-oracle/jre/bin:/home/diego/Dev/go/bin:/home/diego/.vimpkg/bin
