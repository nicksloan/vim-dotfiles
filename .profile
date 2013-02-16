PATH="/usr/local/share/pypy/:/usr/local/share/python/:$(brew --prefix)/bin:$(brew --prefix coreutils)/libexec/gnubin:$(brew --prefix)/Cellar/ruby/1.9.3-p362/bin:$PATH"

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel

for f in /usr/local/etc/bash_completion.d/*.bash; do source $f; done

source $HOME/.env

eval "$(hub alias -s)"

source /usr/local/share/python/virtualenvwrapper_lazy.sh


