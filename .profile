### User installed executables, libraries etc (Program installed via Homebrew)
export PATH="/usr/local/sbin:$PATH"
### Setting PATH for Python 3.7
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
## php
export PATH="/usr/local/opt/php@7.3/bin:$PATH"
export PATH="/usr/local/opt/php@7.3/sbin:$PATH"
### setting PATH for mysql
export PATH=$PATH:/usr/local/mysql/bin
### postgresql
export PATH=”/usr/local/Cellar/postgresql/11.4/bin/pg_config:$PATH”
### Java
#export JAVA_HOME=$(/usr/libexec/java_home -v 12.0.2)
## Java 8
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
### laravel
export PATH=~/.composer/vendor/bin:$PATH
## Android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
### Rabbitmq
export PATH=$PATH:/usr/local/sbin
## Geoserver
export GEOSERVER_HOME=/usr/local/geoserver
## Support utf-8
export PYTHONIOENCODING=UTF-8
# For Localization
export PATH="/usr/local/opt/gettext/bin:$PATH"
## fzf & ripgrep(rg)
if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi
### import alias
source .aliases
