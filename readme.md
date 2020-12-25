# ![Screen Shot 2020-12-02 at 1.00.23 PM.png](https://i.loli.net/2020/12/24/I7D2lfu8czGLKre.png)

This is my neovim configuration.

## Pros

- Nearly make neovim like an IDE
- helpful improvements
- Run fast with nearly 60 plugins
- Integrated with any useful command line tools like [fzf](https://github.com/junegunn/fzf)

## Table of contents

<!-- TOC GFM -->

- [Installation](#installation)
	+ [Using git](#using-git)
- [Requirements](#requirements)
- [Options](#options)
- [Speed](#speed)
- [References](#references)

<!-- /TOC -->

### Installation

#### Using git

You can use git to install these configuration files.

```bash
git clone https://github.com/tandy1229/nvim ~/.config/nvim

# if you want it downloads faster you can run
git clone --depth=1 https://github.com/tandy1229/nvim ~/.config/nvim
```

### Requirements

- Python 3

- pynvim

  To install it, you need to run in your terminal

  ```bash
  pip3 install pynvim
  ```

- Neovim 0.5+ ( [Neovim nightly](https://github.com/neovim/neovim#install-from-source) )

  - For compatibility with `nvim-treesitter`, need Neovim 0.5+
  - For using the colorscheme with `nvim-deus`, need Neovim 0.5+

- Node.js 12.0+

  - For using the smart completion of coc.nvim
  - After installation, you must do `npm install -g neovim`

- coc completion

  - For smart completion of the files.

    ```bash
    # for bash
    npm i -g bash-language-server
    # for go
    brew install gopls
    ```

- [fzf](https://github.com/junegunn/fzf)

- `ag` (`the_silver_searcher`)

  > You can install it with your package manager, if you use brew

  ```bash
  brew install the_silver_searcher
  ```

### Options

- [textidote](https://github.com/sylvainhalle/textidote)

  For users of tex to check the tex syntax

- [shellcheck](https://github.com/koalaman/shellcheck)

  Check the error of sh files

  > You can install it with your package manager, if you use brew:

  ```bash
  brew install shellcheck
  ```

- [shfmt](https://github.com/mvdan/sh)

  AutoFormat the sh file

  > You can install it with your package manager, if you use brew:

  ```bash
  brew install shfmt
  ```

- [ranger](https://github.com/ranger/ranger)

  Document arrangement

- [nerd-font](https://github.com/ryanoasis/nerd-fonts)

  Make your neovim perform better

- [lazygit](https://github.com/jesseduffield/lazygit)

  Use git in a lazy way.

### Speed

Due to I use 60 plugins to make my nvim perform more effective. My neovim become dull sometimes.

I try to make my vimrc file more simple to shorten its startup time, etc.

Doing these makes my neovim run faster.

**With these effects, its startup merely use 170ms with those plugins!!!**

<center><img src="https://i.loli.net/2020/12/09/3uplEq2RFtzCg57.png"></center>

### References

- [ ] inspired by [nvim](https://github.com/theniceboy/nvim) .
