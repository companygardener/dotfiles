# Install

    # Install oh-my-zsh
    # Install homebrew

    ./install                # symlinks home/* into ~ (also fetches vim-plug)
    brew bundle --global     # everything in ~/.Brewfile
    vim +PlugInstall +qall

PATH lives in `sh/path`, shared by bash and zsh. When an installer appends
PATH lines to ~/.profile, ~/.zshrc and friends, move them there.

To set up another machine over SSH: `copy-dotfiles <host>`.

# Resources

* http://statico.github.io/vim2.html
