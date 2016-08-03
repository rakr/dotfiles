# dotfiles
my dotfiles


## Vim and NeoVim

Vim and NeoVim share a common set of configuration file.
Vim relies on the presence of a `.vimrc` whilst NeoVim requires
`./config/nvim/init.vim` file.

I've made the following decisions:

* Use NeoVim as my primary text editor
* Maintain a set of core settings that are share between Vim and Neovim
* Have most of the configuration into a ~/.vimrc file (symlinked)
* `~/.config/nvim/init.vim` holds NeoVim specific configuration
* `~/.config/nvim/init.vim` sources `/.vimrc`

### Plugin manager

My choice is **plug** as it plays very nicely with Neovim.

Knowing that some plugins (like deoplete) require NeoVim and do not work
properly with Vim, below is the structure for installing all the plugins
while maintaining a coherent setup between the two editors.

```
call plug#begin('~/.config/nvim/plugged')

" Several common plugins
Plug ...
Plug ...
Plug ...

" Neovim specific plugins
if filereadable(expand("~/.config/nvim/plugins_neovim.vim"))
  source ~/.config/nvim/plugins.nvim
endif

" Vim specific plugins
if filereadable(expand("~/.config/nvim/plugins_vim.vim"))
  source ~/.config/nvim/plugins.vim
endif

call plug#end()
```

### Plugins settings

While tinkering with plugins settings, this will live in `~/.vimrc`, once
the settings are mature enough, they will be moved to their specific file
and will be sourced.

#### Special note regarding specific plugins

`settings_neovim.vim` and `settings_vim.vim` will replace `~/.vimrc` for
these files. The same process of moving the configuration of these plugins
to their respective files will be followed.

## ZSH

Install the latest and homebrew managed ZSH version:

```
$ brew install zsh
```

### Changing the default shell

Add the following line to `/etc/shells`

```
/usr/local/bin/zsh
```

then fire the following command:

```
$ chsh -s /usr/local/bin/zsh
```
### Prompt

Pure is included

```
$ ln -s "$PWD/pure.zsh" /usr/local/share/zsh/site-functions/prompt_pure_setup
$ ln -s "$PWD/async.zsh" /usr/local/share/zsh/site-functions/async
```

## Git

This folder contains git configuration information

```
$ ln -s ~/.config/git/gitconfig ~/.gitconfig
```

# CLI

```
# Install ncurses
brew install homebrew/dupes/ncurses
```

```
# Install neovim
brew tap neovim/neovim
brew install neovim --HEAD --with-release
brew install python3
pip2 install neovim
pip3 install neovim
```

* [ ] Git
* [ ] Tree
* [ ] Neovim
* [ ] The Silver Searcher
* [ ] Vim
* [ ] Postgresql
* [ ] Elixir
* [ ] Go
* [ ] Node
* [ ] rbenv
* [ ] ruby-build
* [ ] Python3
* [ ] Zsh
* [ ] Toilet (AsciiArt)

**Mac Applications**

* [ ] Hyperterm
* [ ] iTerm2
* [ ] Aerial Screensaver
* [ ] Omnigraffle

# Gists to be reused
```
#!/bin/sh

fancy_echo() {
  local fmt="$1"; shift

  # shellcheck disable=SC2059
  printf "\n$fmt\n" "$@"
}
```

```
create_link() {
  ORIGIN=$1
  DESTINATION=$2

  if [ ! -L $DESTINATION ]; then
    fancy_echo "Creating $DESTINATION"
    ln -s $ORIGIN $DESTINATION
  fi
}
```

```
create_folder() {
  FOLDER=$1
  if [ ! -d $FOLDER ]; then
    fancy_echo "Creating folder $FOLDER"
    mkdir $FOLDER
  fi
}
```


```
# shellcheck disable=SC2154
trap 'ret=$?; test $ret -ne 0 && printf "failed\n\n" >&2; exit $ret' EXIT

# Exits immediately if a pipeline
set -e
```

create_folder ~/Documents/Workspaces/development

```
# Install vim-plug for vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## Hyperterm

### hpm-cli: A plugin manager for hyperterm

```
npm install -g hpm-cli
```
