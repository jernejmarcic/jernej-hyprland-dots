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
