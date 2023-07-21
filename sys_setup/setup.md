# New System Setup

## Install Alfred

* Alfred 5: `https://www.alfredapp.com/`

* Docker: `https://www.docker.com/`

* Rectangle: `https://rectangleapp.com/`

* Zotero:  `https://www.zotero.org/`

* obsidian: `https://obsidian.md/download`

* Xcode:  `https://developer.apple.com/xcode/`

   * Agree to License: `sudo xcoderbuild -license accept`

* iterm2: `https://iterm2.com/downloads.html`

* ohMyZsh:
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

* homebrew:
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

* Neovim:
```
curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-macos.tar.gz
tar xzf nvim-macos.tar.gz
sudo cp ./nvim-macos/bin/nvim /usr/local/bin
sudo cp -a ./nvim-macos/lib/nvim /usr/local/lib
sudo cp -a ./nvim-macos/share /usr/local
```

* Node.js
```bash
brew install node
```

* pyenv:
```bash
brew install openssl readline sqlite3 xz zlib
curl https://pyenv.run | bash
pyenv install 3.9.7
pyenv global 3.9.7
```

 * fzf
 ```
brew install fzf
 ```

 * ripgrep
 ```
 brew install ripgrep
```

* SSH Keys
    * dgx
    ```
    ```

    * gitlab
    ```
    ```

* AWS CLI
```
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /
```

