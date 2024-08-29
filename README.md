# Setup Script

add stuff here some time idk

# The Don't

A note to myself

- do not ever install nerd-fonts-source-code-pro
  it sucks and messes up font awesome rendering

For anyone else who reads this thats not me

- Do not run anything in the scripts folder
  - All of that is for my personal set up
  - Because I am lazy, way to many things are run in root

# Special Notes

Since Nvchad exists on a folder that needs to be changed by its own repo
which means to nvchad config folder needs to be symbolically linked, I.E.

```bash
ln -s ~/config/nvchad/ ~/config/.config/nvim/lua/custom
```

# ZSH

Install oh-my-zsh

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

```

In order to get the highlighting and
auto completion for zsh, I use oh-my-zsh plugin manager
however we still need to pull them with the following

```sh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
```
