### Setting PATH for Python 3.7
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
### setting PATH for mysql
export PATH=$PATH:/usr/local/mysql/bin
### postgresql
export PATH=”/usr/local/Cellar/postgresql/11.4/bin/pg_config:$PATH”
### Java
#export JAVA_HOME=$(/usr/libexec/java_home -v 12.0.2)
## Java 8
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
### alias
# composer
alias composer="php /usr/local/bin/composer.phar"
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
## Git autocomplete
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi