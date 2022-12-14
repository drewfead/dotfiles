Personal Dotfiles
=================

Personal setup of development tools and environment.

Binaries to Install
-------------------
```
# brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# tools
brew install wget
brew install git
brew install exa
brew install bat
brew install fzf
brew install ripgrep
brew install dust

# shell
brew install antigen
brew install oh-my-posh
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font

# languages & runtimes
brew install golang
brew install python@3.9
brew install dotnet

# build tools
brew install yarn
brew install sbt
brew install poetry
brew install miniconda

# linters
brew install goimports
brew install tflint
brew install vale

# secrets
brew install sops
brew install gpg

# cloud
brew install tfenv
brew install kind
brew install serverless
brew install awscli
brew install azure-cli

# fun
brew install cowsay
brew install fortune
brew install lolcat
```

* 🙋 How should I install JDK on a Mac with an **m1 chip**?

    > 👉 For m1 chips you can use [Azul Zulu](https://www.azul.com/downloads/?package=jdk#download-openjdk)