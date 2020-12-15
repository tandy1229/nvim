![Screen Shot 2020-12-02 at 1.00.23 PM.png](https://i.loli.net/2020/12/02/KdbP1m5t8Z2D4Xg.png)
===

This is my neovim configuration.

Most of the configurations is inspired by @theniceboy.

Anyway, it's **AWESOME** !!!

Just enjoy~~~

Pros
----

- Nearly make vim like a IDE
- extremely helpful
- run fast with nearly 60 plugins
- integrated with any useful command line tools like [fzf](https://github.com/junegunn/fzf)

Table of contents
-----------------

<!-- TOC GFM -->

- [Requirements](#requirements)
- [Options](#options)
- [Speed](#speed)

<!-- /TOC -->

### Requirements

* Python 3

* pynvim

	To install it, you need to run in your terminal
	```shell
	pip3 install pynvim
	```

* Neovim 0.5+ ( [Neovim nightly](https://github.com/neovim/neovim#install-from-source) )
  * For compatability with `nvim-treesitter`, need Neovim 0.5+
  * For using the colorscheme with `nvim-deus`, need Neovim 0.5+

* Node.js 12.0+
  * For using the smart completion of coc.nvim
  * After installation, you must do `npm install -g neovim`

* languageserver ()
	* For smart completion of the files.

		 ```shell
		 npm i -g bash-language-server
		 ```
* [fzf](https://github.com/junegunn/fzf)

* `ag` (`the_silver_searcher`)

	> You can install it with your package manager, if you use brew

	```shell
	brew install the_silver_searcher
	```

### Options

* [textidote](https://github.com/sylvainhalle/textidote)

	For users of tex to check the tex syntax

* [shellcheck](https://github.com/koalaman/shellcheck)

	Check the error of bash

	> You can install it with your package manager, if you use brew

	```shell
	brew install shellcheck
	```

* [shfmt](https://github.com/mvdan/sh)

	Autoformat the bash

	> You can install it with your package manager, if you use brew

	```shell
	brew install shfmt
	```

* [ranger](https://github.com/ranger/ranger)

	Document arrangement

* [nerd-font](https://github.com/ryanoasis/nerd-fonts)

	Perform better

* [lazygit](https://github.com/jesseduffield/lazygit)

	Use git in a lazy way.





### Speed

Due to I use 60 plugins to make my nvim perform more effective. My neovim become dull sometimes.

I try to make my vimrc file more simple to shortup its startup time, etc.

Doing these makes my neovim run faster.

**With these effects, its startup merely use 170ms with those plugins!!!**

<center><img src="https://i.loli.net/2020/12/09/3uplEq2RFtzCg57.png"></center>
