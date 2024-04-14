# Starhip powerline
if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source
end

# Greeter
cowsay "WELCOME JERNEJ"


# LSD aliases
alias ls='lsd'
alias l="lsd -lah"



# YEAR OF THE LINUX DESKTOP
alias $(date "+%Y")='echo YEAR OF THE LINUX DESKTOP!'

# Pacman stuff
alias pm='sudo pacman'

alias school='cd ~/Nextcloud/Documents/One-Vault/GimB/'

# Binary path
set -x PATH $PATH /home/jernej/.cargo/bin /home/jernej/.local/share/gem/ruby/3.0.0/bin /home/jernej/CLionProjects/oxiplayer/target/debug /home/jernej/CLionProjects/rustyplayer/target/debug /home/jernej/.local/bin $HOME/Scripts
export PATH="$HOME/bin:$PATH"


alias py='python3'

export LC_ALL=C.UTF-8


export LANG=en_US.UTF-8
export LC_NUMERIC=en_GB.UTF-8
export LC_TIME=en_GB.UTF-8
export LC_MONETARY=sl_SI.UTF-8
export LC_PAPER=en_GB.UTF-8
export LC_NAME=sl_SI.UTF-8
export LC_ADDRESS=sl_SI.UTF-8
export LC_TELEPHONE=sl_SI.UTF-8
export LC_MEASUREMENT=en_GB.UTF-8
export LC_IDENTIFICATION=sl_SI.UTF-8
